#!/bin/bash
GPU=1 # can be "0,1,2,3"
MODELS="ResNet50_sgm" # 
CLASSIFIER_TYPES="inner_product"
KGTM_ENSEMBLE_NETWORKS="wiki,hierarchy,glove" # "hierarchy,glove wiki,glove wiki,hierarchy,glove wiki,hierarchy"
KGTM_ENSEMBLE_METHODS="max"

DataPath='../DataSplit/KGTN'

cd KGTN
for kgtm_ensemble_method in $KGTM_ENSEMBLE_METHODS; do
  for kgtm_ensemble_network in $KGTM_ENSEMBLE_NETWORKS; do
    for model in $MODELS; do
      for classifier_type in $CLASSIFIER_TYPES; do
      
        # Build the output directory name
        if [ ${classifier_type} == "inner_product" ]; then
          classifier_type_output="InnerProduct"
        elif [ ${classifier_type} == "cosine" ]; then
          classifier_type_output="CosSim"
        elif [ ${classifier_type} == "pearson" ]; then
          classifier_type_output="PearCorr"
        else 
          echo "Bad classifier_type. Exiting."
          exit 1
        fi
        
        # if [ ${OutDir} == "../results/2023Oct2/KGTNens-ResNet18_sgm-max-InnerProduct-wiki,glove" ]; then  # TODO: remove later
        #   continue
        # fi
        
        
        # Low-shot benchmark without generation
        for j in 1 2 5 10; do  # TODO: it was 1 2 5 10
          for i in 1; do #{1..5}; do

            OutDir="../results/2023Oct2-R50/KGTNens-${model}-${kgtm_ensemble_method}-${classifier_type_output}-${kgtm_ensemble_network}"
            SaveModelDir="../results/checkpoints/KGTNens-${model}-${kgtm_ensemble_method}-${classifier_type_output}-${kgtm_ensemble_network}"
            echo $OutDir
            if [ $j == 1 ];then
              maxiters=2000
            elif [ $j == 2 ];then
              maxiters=3000
            else
              maxiters=10000
            fi
            {
            CUDA_VISIBLE_DEVICES=${GPU} python main_KGTN-onlytest.py \
              --lowshotmeta ${DataPath}/label_idx.json \
              --experimentpath ${DataPath}/experiment_cfgs/splitfile_{:d}.json \
              --experimentid  $i --lowshotn $j \
              --trainfile ../features/${model}/train.hdf5 \
              --testfile ../features/${model}/val.hdf5 \
              --outdir ${OutDir} \
              --model_to_load "../results/checkpoints/KGTNens-ResNet50_sgm-max-InnerProduct-${kgtm_ensemble_network}/ResNet50_sgm_lr_0.010_wd_0.000_expid_1_lowshotn_${j}.pt" \
              --lr 0.01 --wd 0.0001 \
              --testsetup 1 \
              --l2_reg 0.001 \
              --maxiters $maxiters \
              --use_all_base \
              --use_knowledge_propagation \
              --ggnn_time_step 2 \
              --kgtm_ensemble true \
              --kgtm_ensemble_networks ${kgtm_ensemble_network} \
              --kgtm_ensemble_method ${kgtm_ensemble_method} \
              --classifier_type ${classifier_type} \
              --dump_weights_and_features "../results/entropy/${model}-${kgtm_ensemble_method}-${classifier_type_output}-${kgtm_ensemble_network}-${j}-${i}" \
              --eval_mode "ids" \
              --eval_out_path "../results/eval_ids/${model}-${kgtm_ensemble_method}-${classifier_type_output}-${kgtm_ensemble_network}-${j}-${i}.npy"
              } #&
          done
        done
        # wait
      done
    done
  done
done





