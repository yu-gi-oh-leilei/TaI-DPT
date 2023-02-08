#!/bin/bash

cd ..

# custom config
DATA=/media/data2/MLICdataset/
TRAINER=Caption_distill_double

DATASET=$1
CFG=$2  # config file
CTP=$3  # class token position (end or middle)
NCTX=$4  # number of context tokens
CSC=$5  # class-specific context (False or True)
run_ID=$6

export CUDA_VISIBLE_DEVICES=1

for SEED in 1 2 3
do
    DIR=output/${run_ID}/${TRAINER}/${CFG}/nctx${NCTX}_csc${CSC}_ctp${CTP}/seed${SEED}
    if [ -d "$DIR" ]; then
        echo "Results are available in ${DIR}. Skip this job"
    else
        echo "Run this job andsave the output to ${DIR}"
        python train_caption.py \
        --root ${DATA} \
        --seed ${SEED} \
        --trainer ${TRAINER} \
        --dataset-config-file configs/datasets/${DATASET}.yaml \
        --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
        --output-dir ${DIR} \
        TRAINER.Caption.N_CTX ${NCTX} \
        TRAINER.Caption.CSC ${CSC} \
        TRAINER.Caption.CLASS_TOKEN_POSITION ${CTP}
    fi
done

# bash main.sh voc2007_distill rn50_voc2007 end 16 False voc2007_caption
# bash main.sh coco2014_distill rn50_coco2014 end 16 False coco2014_caption
# bash main.sh nuswide_distill_limit rn50_nuswide end 16 False nuswide_caption
