#!/bin/bash

# set this to your python binary
export PYTHONBIN='/home/luyuchen.paul/.conda/envs/pytorch/bin/python'
export PYTHONUNBUFFERED=1

# set exp root dir and dataset root dir
export DATA_DIR='/home/luyuchen.paul/NV_outlier/'
export EXP_DIR='/home/luyuchen.paul/exp_results'

declare -a outliers=("NV")

# loop through outlier classes
for outlier in "${outliers[@]}"
do
    echo "#################TRAIN ${outlier} ##################"
    $PYTHONBIN train.py --data ${DATA_DIR} --cuda \
        --epochs 40 --lr 1e-4 --batch_size 32 --out_dir ${EXP_DIR}/${outlier}_kl0.01 \
        --image_size 128 --kl_weight 0.01
done
