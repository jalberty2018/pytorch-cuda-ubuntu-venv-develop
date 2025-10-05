# syntax=docker/dockerfile:1.7
FROM nvidia/cuda:12.9.1-cudnn-devel-ubuntu24.04

WORKDIR /
ENV DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1 PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 \
    VENV_PATH=/opt/venv \
    HF_HUB_DISABLE_TELEMETRY=1 \
    TZ=Etc/UTC

# runtimes
RUN apt-get update && apt-get install -y --no-install-recommends \
      python3 python3-venv python3-dev \
      ca-certificates curl wget git git-lfs ffmpeg \
      libgl1 libglib2.0-0 libsm6 libxext6 libxrender1 libglx-mesa0 \
      build-essential make cmake apt-utils ninja-build pkg-config libcairo2-dev \
      jq unzip p7zip-full ncdu lsof nvtop pciutils lshw htop mc nano vim tmux \
      openssh-server openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Start venv
RUN python3 -m venv ${VENV_PATH}
ENV PATH="${VENV_PATH}/bin:${PATH}"
RUN python -m ensurepip --upgrade || true

# Install pytorch, triton and others
ARG TORCH_INDEX_URL="https://download.pytorch.org/whl/cu129"
RUN --mount=type=cache,target=/root/.cache/pip \
    python -m pip install --upgrade pip setuptools wheel && \
    python -m pip install --extra-index-url ${TORCH_INDEX_URL} \
      torch torchvision torchaudio "triton>=2.3,<3" "huggingface_hub[cli]" psutil diffusers

# Metadata
LABEL org.opencontainers.image.title="Develop CUDA24 + PyTorch cu129 Base" \
      org.opencontainers.image.description="Base image: CUDA 12.9 devel + Ubuntu 24.04 + Python venv + PyTorch cu129 + triton" \
      org.opencontainers.image.source="https://hub.docker.com/r/ls250824/pytorch-cuda-ubuntu-venv-develop" \
      org.opencontainers.image.licenses="MIT"