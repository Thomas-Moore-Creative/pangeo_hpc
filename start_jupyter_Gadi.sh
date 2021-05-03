#!/bin/bash -l

#PBS -P v14
#PBS -l storage=gdata/v14+scratch/v14+scratch/ux06+gdata/lp01+scratch/lp01+gdata/rr3+scratch/rr3+gdata/hh5+scratch/hh5+gdata/eg3+scratch/eg3+gdata/al33+scratch/al33+gdata/r87+scratch/r87

#PBS -q normal
#PBS -l walltime=02:00:00
#PBS -l mem=16gb
#PBS -l ncpus=4
#PBS -l jobfs=100GB
#PBS -l wd
#PBS -j oe
##PBS -o /dev/null

# ====================================
# Submit a job running Jupyter on Gadi
#
#    USAGE: qsub -v NOTEBOOK_DIR=<directory to start notebook in> \
#                -v RUN_SCRIPT_DIR=<location of start_jupyter.sh> \
#                -v PANGEO_ENV_NAME=<name of pangeo environment> \
#		 start_jupyter_Gadi.sh
#
#    Dougie Squire
#    19/08/2020
# ====================================

if [ ! $# -eq 0 ]; then
    NOTEBOOK_DIR=$1
    RUN_SCRIPT_DIR=$2
    PANGEO_ENV_NAME=$3
fi

# USER TO EDIT (optional)
# ----------------------------
LOG_DIR=/scratch/${PROJECT}/${USER}/tmp/logs
# ----------------------------

HPC_ADDRESS=gadi.nci.org.au

${RUN_SCRIPT_DIR}/start_jupyter.sh ${NOTEBOOK_DIR} ${LOG_DIR} ${HPC_ADDRESS} ${PANGEO_ENV_NAME}
