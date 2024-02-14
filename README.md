# KGTN-ens: Few-Shot Image Classification with Knowledge Graph Ensembles

This is the implementation for the [KGTN-ens paper, published in Applied Intelligence]([https://arxiv.org/abs/2211.03199](https://link.springer.com/article/10.1007/s10489-023-05129-8)).

<p align="center">
<img src="https://media.springernature.com/full/springer-static/image/art%3A10.1007%2Fs10489-023-05129-8/MediaObjects/10489_2023_5129_Fig1_HTML.png"  width=50% height=50% >
</p>

> We propose KGTN-ens, a framework to incorporate multiple knowledge graph embeddings at a small cost. 
There are many real-world scenarios in which the amount of data is severely limited.
Prior knowledge can be used to tackle this task. 
The purpose of this study is to investigate the possibility of combining multiple knowledge sources.
We evaluate it with different embeddings in a few-shot image classification task.
We also construct a new knowledge source – Wikidata embeddings – and evaluate it with KGTN and KGTN-ens.
With ResNet50, our approach outperforms KGTN in terms of the top-5 accuracy on the ImageNet-FS dataset for the majority of tested settings.
For $k \in {1, 2, 5, 10}$ respectively, we obtained +0.63/+0.58/+0.43/+0.26 pp. (novel classes) and +0.26/+0.25/+0.32/–0.04 pp. (all classes).

If you use this work, please cite it accordingly:
```
Filipiak, D., Fensel, A. & Filipowska, A. KGTN-ens: Few-Shot Image Classification with Knowledge Graph Ensembles. Applied Intelligence (2024). https://doi.org/10.1007/s10489-023-05129-8
```
or, in BibTeX:
```bib
@article{filipiak2024kgtnens,
  title={KGTN-ens: Few-Shot Image Classification with Knowledge Graph Ensembles},
  author={Filipiak, Dominik and Fensel, Anna and Filipowska, Agata},
  journal={Applied Intelligence},
  year={2024},
  doi = {10.1007/s10489-023-05129-8}
}
```

## Running the code

The code is based on the [KGTN](https://github.com/MyChocer/KGTN) implementation, so running it is almost the same as in described in [KGTN readme](https://github.com/MyChocer/KGTN/blob/master/README.md).

The only difference is the script location and parameters (see e.g. `KGTN2/scripts/ResNet50_sgm/` for ResNet50 experiments). 
Usually, the first arguments denotes the GPU number to run the script on, but make sure you read the script before running it.

The embeddings are in the repository in `KnowledgeGraphMatrix`, but if you want to check the code for their creation (and see the  addtional experiments), please check the `notebooks/` directory.


### Requirements for reproducing the results
The easiest way will be through using this [docker image](https://hub.docker.com/layers/0xdfdfdf/ai-notebook/kgtn-ens-committed/images/sha256-8b58b7118878a09a337fe43433dfa947720046506a1147455eca9281c6959936?context=repo).

The experiments were run on Python 3.6.9.

 ```{shell}
 root@2e35de100a8f:/tf/KGTN2# nvcc --version
 nvcc: NVIDIA (R) Cuda compiler driver
 Copyright (c) 2005-2018 NVIDIA Corporation
 Built on Sat_Aug_25_21:08:01_CDT_2018
 Cuda compilation tools, release 10.0, V10.0.130
 ```
 
 ```{shell}
 root@2e35de100a8f:/tf/KGTN2# nvidia-smi
 +-----------------------------------------------------------------------------+
 | NVIDIA-SMI 525.89.02    Driver Version: 525.89.02    CUDA Version: 12.0     |
 |-------------------------------+----------------------+----------------------+
 | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
 | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
 |                               |                      |               MIG M. |
 |===============================+======================+======================|
 |   0  NVIDIA GeForce ...  On   | 00000000:19:00.0 Off |                  N/A |
 | 27%   25C    P8    20W / 260W |      1MiB / 11264MiB |      0%      Default |
 |                               |                      |                  N/A |
 +-------------------------------+----------------------+----------------------+
 |   1  NVIDIA GeForce ...  On   | 00000000:1A:00.0 Off |                  N/A |
 | 27%   26C    P8    20W / 260W |      1MiB / 11264MiB |      0%      Default |
 |                               |                      |                  N/A |
 +-------------------------------+----------------------+----------------------+
 |   2  NVIDIA GeForce ...  On   | 00000000:67:00.0 Off |                  N/A |
 | 27%   28C    P8     7W / 260W |      1MiB / 11264MiB |      0%      Default |
 |                               |                      |                  N/A |
 +-------------------------------+----------------------+----------------------+
 |   3  NVIDIA GeForce ...  On   | 00000000:68:00.0 Off |                  N/A |
 | 27%   32C    P8    21W / 260W |      1MiB / 11264MiB |      0%      Default |
 |                               |                      |                  N/A |
 +-------------------------------+----------------------+----------------------+
 +-----------------------------------------------------------------------------+
 | Processes:                                                                  |
 |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
 |        ID   ID                                                   Usage      |
 |=============================================================================|
 |  No running processes found                                                 |
 +-----------------------------------------------------------------------------+
 ```

 ```{bash}
root@2e35de100a8f:/tf/KGTN2# uname-a
Linux 2e35de100a8f 5.10.0-21-amd64 #1 SMP Debian 5.10.162-1 (2023-01-21) x86_64 x86_64 x86_64 GNU/Linux
```
