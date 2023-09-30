MODEL_FULL=ResNet10_sgm
MODEL=ResNet10

mkdir -p features/${MODEL_FULL}
cd FeatureExtractor

DataPath='../DataSplit/FeatureExtractor'

ModelFile=../checkpoints/${MODEL_FULL}/89.tar
TrainOutFile=../features/${MODEL_FULL}/train.hdf5
ValOutFile=../features/${MODEL_FULL}/val.hdf5

echo "Saving train feature..."
CUDA_VISIBLE_DEVICES=0
python ./save_features.py \
      --cfg ${DataPath}/train_save_data.yaml \
      --outfile ${TrainOutFile} \
      --modelfile ${ModelFile} \
      --model ${MODEL}
echo "Finishing"

echo "Saving val feature..."
# CUDA_VISIBLE_DEVICES=4 
python ./save_features.py \
      --cfg ${DataPath}/val_save_data.yaml \
      --outfile ${ValOutFile} \
      --modelfile ${ModelFile} \
      --model ${MODEL}
echo "Finishing"
