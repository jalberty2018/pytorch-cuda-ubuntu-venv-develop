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
| Triton    | `2.4.x`               |
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
