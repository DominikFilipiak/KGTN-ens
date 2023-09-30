#!/bin/bash

MODEL_FULL=ResNet10_sgm

DataPath=../DataSplit/KGTN
OutDir=../results/KGTN_PearCorr-${MODEL_FULL}

cd KGTN


# Low-shot benchmark without generation
for j in 1 2 5 10
do
  for i in {1..5}
  do
    if [ $j == 1 ];then
    maxiters=2000
    elif [ $j == 2 ];then
    maxiters=3000
    else
    maxiters=10000
    fi

    CUDA_VISIBLE_DEVICES=$1 python main_KGTN.py \
      --lowshotmeta ${DataPath}/label_idx.json \
      --experimentpath ${DataPath}/experiment_cfgs/splitfile_{:d}.json \
      --experimentid  $i --lowshotn $j \
      --trainfile ../features/${MODEL_FULL}/train.hdf5 \
      --testfile ../features/${MODEL_FULL}/val.hdf5 \
      --outdir ${OutDir} \
      --lr 0.01 --wd 0.0001 \
      --testsetup 1 \
      --l2_reg 0.001 \
      --maxiters $maxiters \
      --use_all_base \
      --use_knowledge_propagation \
      --ggnn_time_step 2 \
      --ggnn_coefficient 0.4 \
      --adjacent_matrix_file ../KnowledgeGraphMatrix/SemanticGraph.npy \
      --process_type semantic \
      --classifier_type pearson
  done
done

# parse results
echo "${MODEL_FULL} SGM results (no generation)"
python ../parse_results.py --resultsdir ${OutDir} \
  --repr ${MODEL_FULL} \
  --lr 0.01 --wd 0.0001






