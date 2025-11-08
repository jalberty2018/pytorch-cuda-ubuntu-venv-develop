[![Docker Image Version](https://img.shields.io/docker/v/ls250824/pytorch-cuda-ubuntu-venv-develop)](https://hub.docker.com/r/ls250824/pytorch-cuda-ubuntu-venv-develop)

# pytorch-cuda-ubuntu-venv-develop image

A venv base Docker Ubuntu 24.x base image with Python PyTorch CUDA develop triton support.

## Base Image

This image is built on top of Nvidia Ubuntu official Docker images, ensuring compatibility with CUDA cudnn

- [Nvidia CUDA](https://hub.docker.com/r/nvidia/cuda/tags?name=12)
- [Pytorch.org](https://pytorch.org)
- [Triton](https://triton-lang.org/main/index.html)

## Setup

| Component | Version              |
|-----------|----------------------|
| OS        | `Ubuntu 24.04 x86_64` |
| Python    | `3.12.x`             |
| PyTorch   | `2.8.0`              |
| CUDA      | `12.9.1`             |
| Triton    | `3.6.x`               |
| nvcc      | `12.9.x`            |

## venv setting for subsequent images

```docker
FROM ls250824/pytorch-cuda-ubuntu-venv-develop:<date>
ENV PATH="/opt/venv/bin:${PATH}"
```

## Available Images

### Image Pytorch 2.8.0

Base Image: nvidia/cuda:12.9.1-cudnn-devel-ubuntu24.04

Custom Build: 

```bash
docker pull ls250824/pytorch-cuda-ubuntu-venv-develop:<date>
```

## Building the Docker Image

You can build and push the image to Docker Hub using the `build-docker.py` script.

### Build Script Options

| Option         | Description                                         | Default                |
|----------------|-----------------------------------------------------|------------------------|
| `--username`   | Docker Hub username                                 | Current user           |
| `--tag`        | Tag to use for the image                            | Today's date           |
| `--latest`     | If specified, also tags and pushes as `latest`      | Not enabled by default |

### Build & Push Command

Run the following command to clone the repository and build the image:

```bash
git clone https://github.com/jalberty2018/pytorch-cuda-ubuntu-venv-develop.git
cp pytorch-cuda-ubuntu-venv-develop/build-docker.py ..

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

python3 build-docker.py \
--username=<your_dockerhub_username> \
--tag=<custom_tag> \ 
pytorch-cuda-ubuntu-venv-develop
```

Note: If you want to push the image with the latest tag, add the --latest flag at the end.
