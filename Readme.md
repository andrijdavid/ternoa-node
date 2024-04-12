[![Docker Repository on Quay](https://quay.io/repository/andrijdavid/ternoa-node/status "Docker Repository on Quay")](quay.io/andrijdavid/ternoa-node:latest)
![Docker build](https://github.com/andrijdavid/ternoa-node/actions/workflows/docker.yml/badge.svg)


# Ternoa Node Docker Image

This repository contains a Docker image for running a Ternoa node on your system. Ternoa is a blockchain project that focuses on preserving and transmitting digital data across generations using NFT Time Capsules.

## Ternoa Project

[Ternoa](https://www.ternoa.com/) is a blockchain-based platform that introduces the concept of "NFT Time Capsules." These time capsules allow users to encapsulate digital assets, such as photos, videos, or documents, into non-fungible tokens (NFTs) stored on the Ternoa blockchain. The project aims to combine blockchain technology with long-term data preservation, offering a unique solution for managing and sharing digital memories.

## Getting Started

Follow these steps to get the Ternoa node up and running using Docker.

### Prerequisites

- Docker installed on your system. You can download Docker from [here](https://www.docker.com/get-started).

### Usage

1. Pull the Ternoa Docker image from the repository:

    ```bash
    docker pull quay.io/andrijdavid/ternoa-node:latest
    ```

2. Run the Ternoa node container:

    ```bash
    docker run -d --name ternoa-node -p 127.0.0.1:9944:9944 -p 127.0.0.1:9933:9933 -p 30333:30333 quay.io/andrijdavid/ternoa-node:latest
    ```

    This command starts the Ternoa node container in detached mode, mapping port 5000 on your host to port 5000 in the container. Adjust the port mapping as needed.

   `/data`

    This container uses a local folder to store the chain data. This means that every time a new container is created the chain will start from block 0. To avoid this the container volume `/data` needs to be mapped to a directory on the host machine. With this mapping done all the chain data will be stored on the host and it can be used with multiple containers.
   
    ```bash
        docker run -d -v ./ternoa-data:/data --name ternoa-node -p 127.0.0.1:9944:9944 -p 127.0.0.1:9933:9933 -p 30333:30333 quay.io/andrijdavid/ternoa-node:latest
    ```

    You can pass additional parameters
   ```bash
        docker run -d -v ./ternoa-data:/data --name ternoa-node -p 127.0.0.1:9944:9944 -p 127.0.0.1:9933:9933 -p 30333:30333 quay.io/andrijdavid/ternoa-node:latest --chain alphanet-dev --alice --tmp --name MyLocalNode --rpc-external --ws-external --rpc-cors all --telemetry-url "wss://telemetry.polkadot.io/submit/ 0"
    ```   
   If You Want To Run An Archive Node

```bash
  docker run -d -v ./ternoa-data:/data --name ternoa-node -p 127.0.0.1:9944:9944 -p 127.0.0.1:9933:9933 -p 127.0.0.1:30333:30333 quay.io/andrijdavid/ternoa-node:latest --name MyFirstNode  --chain mainnet --base-path /block/chain/node-data --ws-max-connections 1000 --validator --telemetry-url "wss://telemetry.polkadot.io/submit/ 0" --state-pruning archive
```



## Customization

If you need to customize the Ternoa node configuration, you can mount a configuration file into the container. For example:

```bash
docker run -d --name ternoa-node -p 127.0.0.1:9944:9944 -p 127.0.0.1:9933:9933 -p 30333:30333 -v /path/to/config:/opt/node-data your-username/ternoa-node:latest --name MyFirstNode --chain alphanet --base-path /opt/node-data --validator --execution wasm
```
More information here [https://www.ternoa.network/validators](https://docs.ternoa.network/for-node-operators/system-requirements)

TERNOA: 5CLkPH698WWp1RtTH7pKvN6Y4C94DeypiyNnxgdiEAgLuBUC
