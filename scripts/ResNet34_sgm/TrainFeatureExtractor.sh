#!/bin/bash

cd FeatureExtractor

DataPath='../DataSplit/FeatureExtractor'
CheckpointDir='../checkpoints/ResNet34_sgm'

mkdir -p ${CheckpointDir}

CUDA_VISIBLE_DEVICES=0,1 python main.py --model ResNet34 \
  --traincfg ${DataPath}/base_classes_train_template_smallbatch.yaml \
  --valcfg ${DataPath}/base_classes_val_template.yaml \
  --print_freq 100000000 --save_freq 5 \
  --aux_loss_wt 0.005 --aux_loss_type sgm \
  --lr 0.1 --warmup_epochs 1 \
  --checkpoint_dir ${CheckpointDir}
