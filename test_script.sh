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
OUTPUT_DIR="${WORK_DIR}/results"
NAME="brain_ct2mri"
MODEL="test"

TEST_MODE="ct_to_mri"   # options: ct_to_mri | mri_to_ct

if [ "${TEST_MODE}" = "ct_to_mri" ]; then
    TEST_NAME="testA"
    NUM_TEST=$(ls "${DATA_ROOT}/${TEST_NAME}" | wc -l)

    cp "${CHKPTS_DIR}/${NAME}/latest_net_G_A.pth" \
       "${CHKPTS_DIR}/${NAME}/latest_net_G.pth"

elif [ "${TEST_MODE}" = "mri_to_ct" ]; then
    TEST_NAME="testB"
    NUM_TEST=$(ls "${DATA_ROOT}/${TEST_NAME}" | wc -l)

    cp "${CHKPTS_DIR}/${NAME}/latest_net_G_B.pth" \
       "${CHKPTS_DIR}/${NAME}/latest_net_G.pth"
else
    echo "Invalid TEST_MODE: ${TEST_MODE}"
    exit 1
fi

python test.py \
  --dataroot "${DATA_ROOT}/${TEST_NAME}" \
  --checkpoints_dir "${CHKPTS_DIR}" \
  --results_dir "${OUTPUT_DIR}" \
  --name "${NAME}" \
  --model "${MODEL}" \
  --num_test "${NUM_TEST}" \
  --no_dropout