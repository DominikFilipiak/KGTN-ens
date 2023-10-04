#!/bin/bash

cd FeatureExtractor

DataPath='../DataSplit/FeatureExtractor'
CheckpointDir='../checkpoints/ResNet34_sgm'

mkdir -p ${CheckpointDir}

CUDA_VISIBLE_DEVICES=0,1,2,3 python main.py --model ResNet34 \
  --traincfg ${DataPath}/base_classes_train_template_smallbatch.yaml \
  --valcfg ${DataPath}/base_classes_val_template.yaml \
  --print_freq 100000000 --save_freq 5 \
  --aux_loss_wt 0.005 --aux_loss_type sgm \
  --lr 0.1 --warmup_epochs 1 \
  --allow_resume 1 --resume_file "/home/dfilipiak/projects/KGTN2/checkpoints/ResNet34_sgm/5.tar" \
  --checkpoint_dir ${CheckpointDir}
# parser.add_argument('--allow_resume', default=0, type=int)
#     parser.add_argument('--resume_file', default=None, help='resume from file')
    