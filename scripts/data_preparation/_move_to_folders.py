import json
import os

# Script for organising ILSVRC2012 data in the correct format (subfolders with the class name)

DATA_VAL_FOLDER = "/Users/dfilipiak/repositories/publikacje/PUB-2021-OneShotKG/KGTN2/data/ILSVRC/Data/CLS-LOC/val"
VAL_JSON = '/Users/dfilipiak/repositories/publikacje/PUB-2021-OneShotKG/KGTN2/DataSplit/FeatureExtractor/val.json'

os.chdir(DATA_VAL_FOLDER)

with open(VAL_JSON) as f:
    data = json.load(f)

for image_name in data['image_names']:
    parts = image_name.split('/')
    file_name = parts[2]
    directory = parts[1]
    if os.path.exists(file_name):
        if not os.path.exists(directory):
            os.mkdir(directory)
        os.rename(file_name, os.path.join(directory, file_name))

