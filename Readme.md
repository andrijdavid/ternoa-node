![Docker Repository on Quay](https://quay.io/repository/andrijdavid/ternoa-node/status "Docker Repository on Quay")](https://quay.io/repository/andrijdavid/ternoa-node)
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
    docker run -d --name ternoa-node -p 5000:5000 quay.io/andrijdavid/ternoa-node:latest
    ```

    This command starts the Ternoa node container in detached mode, mapping port 5000 on your host to port 5000 in the container. Adjust the port mapping as needed.

3. Access the Ternoa node:

    Open your web browser and navigate to [http://localhost:5000](http://localhost:5000). You should see the Ternoa node interface.

## Customization

If you need to customize the Ternoa node configuration, you can mount a configuration file into the container. For example:

```bash
docker run -d --name ternoa-node -p 5000:5000 -v /path/to/config:/app/config your-username/ternoa-node:latest
