FROM debian:12.2-slim as builder
ARG VER=v1.3.2

# This installs all dependencies that we need (besides Rust).
RUN apt update -y && \
    apt install build-essential git clang curl libssl-dev llvm libudev-dev make protobuf-compiler -y

# This installs Rust and updates Rust to the right version.
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rust_install.sh && chmod u+x rust_install.sh && ./rust_install.sh -y && \
    . $HOME/.cargo/env && rustup update && rustup show

# Get all submodules
RUN git clone --recurse-submodules https://github.com/capsule-corp-ternoa/ternoa-node 

WORKDIR /ternoa-node 

RUN git checkout $VER

# This builds the binary.
RUN $HOME/.cargo/bin/cargo build --locked --release

FROM bitnami/minideb

COPY --from=builder /ternoa-node/target/release/ternoa /bin/ternoa
VOLUME /data
EXPOSE 30333 9933 9944 9615
ENTRYPOINT ["/bin/ternoa"]

