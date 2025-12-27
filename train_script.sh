#!/bin/bash
# ---
# © Ashkan M., NTNU  
# Released under the MIT License
# ---

WORK_DIR="./workdir"
CURR_DIR="${WORK_DIR}/pytorch-CycleGAN-and-pix2pix"

cd "${CURR_DIR}" || exit 1

DATA_ROOT="${WORK_DIR}/datasets/brain_ct2mri/images"
CHKPTS_DIR="${WORK_DIR}/checkpoints"
NAME="brain_ct2mri"
MODEL="cycle_gan"
INIT_LR=0.0005
N_EPOCHS=5
N_EPOCHS_DECAY=150

python train.py \
  --dataroot "${DATA_ROOT}" \
  --checkpoints_dir "${CHKPTS_DIR}" \
  --name "${NAME}" \
  --model "${MODEL}" \
  --n_epochs "${N_EPOCHS}" \
  --n_epochs_decay "${N_EPOCHS_DECAY}" \
  --lr "${INIT_LR}" \
  --use_wandb

# ./train_script.sh