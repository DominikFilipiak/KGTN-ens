# KGTN-ens

This is the implementation for the [KGTN-ens paper](https://arxiv.org/abs/2211.03199).
It heavily relies on the [KGTN implementation](https://github.com/MyChocer/KGTN).

If you use this work, please cite it accordingly:
> Filipiak, D., Fensel, A., & Filipowska, A. (2022). KGTN-ens: Few-Shot Image Classification with Knowledge Graph Ensembles. arXiv preprint arXiv:2211.03199.

or
>@article{filipiak2022kgtn,<br/>
>  title={KGTN-ens: Few-Shot Image Classification with Knowledge Graph Ensembles},<br/>
>  author={Filipiak, Dominik and Fensel, Anna and Filipowska, Agata},<br/>
>  journal={arXiv preprint arXiv:2211.03199},<br/>
>year={2022}<br/>
>}

## Running the code

Exactly the same as in `https://github.com/MyChocer/KGTN/blob/master/README.md`.

The only difference is the script location and parameters (see e.g. `KGTN2/scripts/ResNet50_sgm/` for ResNet50 experiments). 
Usually, the first arguments denotes the GPU number to run the script on.


### Requirements for reproducing the results
The easiest way will be through using this [commited docker image](https://hub.docker.com/layers/0xdfdfdf/ai-notebook/kgtn-ens-committed/images/sha256-8b58b7118878a09a337fe43433dfa947720046506a1147455eca9281c6959936?context=repo).


The experiments were run with Python 3.6.9.

 ```{shell}
 root@2e35de100a8f:/tf/KGTN2# nvcc --version
 nvcc: NVIDIA (R) Cuda compiler driver
 Copyright (c) 2005-2018 NVIDIA Corporation
 Built on Sat_Aug_25_21:08:01_CDT_2018
 Cuda compilation tools, release 10.0, V10.0.130
 ```

 ```{shell}
 root@2e35de100a8f:/tf/KGTN2# nvidia-smi
 Wed Oct  4 14:06:01 2023
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
Linux 2e35de100a8f 5.10.0-21-amd64 #1 SMP Debian 5.10.162-1 (2023-01-21) x86_64 x86_64 x86_64 GNU/Linux
```