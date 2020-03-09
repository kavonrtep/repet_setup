#!/bin/bash
docker exec -d -w /home/centos/data/TEannot repet bash -c "source /home/centos/.bash_profile; source /home/centos/.bashrc; launch_TEannot.py -S 1234578 -P genome -C TEannot.cfg > log.txt 2> err.txt && echo \"OK\" > status || echo  \"ERROR\" > status"
