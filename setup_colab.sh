#!/bin/bash

# Connect to Google Drive
from google.colab import drive
drive.mount('/content/gdrive')

# Clone the repository
!pip install pygit2==1.12.2
%cd /content
!git https://github.com/mangostrobericream/ForgeUI-Colab
%cd /content/ForgeUI-Colab

# Define the main path
mainpth="MyDrive"

# Download the Flux Fusion V2 model
flux_fusion_v2_url="https://civitai.com/api/download/models/936309?type=Model&format=SafeTensor&size=full&fp=fp16"
flux_fusion_v2_path="/content/ForgeUI-Colab/models/Stable-diffusion/FluxFusionV2fp16.safetensors"
api_key="a0d388292011bc9e6788d65f6d54df5c"

# Use curl to download the Flux Fusion V2 model with the authorization header
!curl -L -H "Authorization: Bearer {api_key}" "{flux_fusion_v2_url}" --output "{flux_fusion_v2_path}"

# Download the FLUX.1-dev model VAE
flux_1_dev_url="https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors?download=true"
flux_1_dev_path="/content/ForgeUI-Colab/models/VAE/ae.safetensors"

# Use curl to download the FLUX.1-dev model with the authorization header
!curl -L -H "Authorization: Bearer {api_key}" "{flux_1_dev_url}" --output "{flux_1_dev_path}"

# Download the text encoders for GGUF
clip_l_url="https://huggingface.co/openai/clip-vit-large-patch14"
t5_xxl_url="https://huggingface.co/