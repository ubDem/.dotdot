#!/bin/bash

source ~/anaconda/etc/profile.d/conda.sh
conda activate $1
conda install -y ipykernel
ipython kernel install --user --name=$1
conda deactivate

echo Kernel $1 has been added to the jupyterlab kernels
