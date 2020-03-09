#!/bin/bash
docker exec -d -w /home/centos/data/TEdenovo repet bash -c "source /home/centos/.bash_profile; source /home/centos/.bashrc; launch_TEdenovo.py -P genome -C TEdenovo.cfg > log.txt 2> err.txt && echo \"OK\" > status || echo  \"ERROR\" > status"
