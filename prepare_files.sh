#!/bin/bash
# fasta file to annotate:
INPUT_FASTA=REPLACE_WITH_PATH_TO_GENE.FASTA

mkdir -p shared/TEdenovo
mkdir -p shared/TEannot

# shared is /home/centos/data in docker image
# add data for annatation
cp $INPUT_FASTA shared/TEdenovo/genome.fa
cp $INPUT_FASTA shared/TEannot/genome.fa
# copy file to avoid symlinks problem (host vs docker)
docker exec -it repet cp  /share/banks/ProfilesBankForREPET_Pfam27.0_GypsyDB.hmm \
       /home/centos/data/TEdenovo/ProfilesBankForREPET_Pfam27.0_GypsyDB.hmm
docker exec -it repet cp  /share/banks/repbase20.05_aaSeq_cleaned_TE.fsa \
       /home/centos/data/TEdenovo/repbase20.05_aaSeq_cleaned_TE.fsa
docker exec -it repet cp  /share/banks/repbase20.05_ntSeq_cleaned_TE.fsa \
       /home/centos/data/TEdenovo/repbase20.05_ntSeq_cleaned_TE.fsa

# set configuration
cp TEdenovo.cfg shared/TEdenovo/TEdenovo.cfg
cp TEannot.cfg shared/TEannot/TEannot.cfg

# create symling to TE bank - not available until TEdenovo finishes
docker exec -it repet ln -sf \
       /home/centos/data/TEdenovo/genome_Blaster_GrpRecPil_Map_TEclassif_Filtered/genome_sim_denovoLibTEs_filtered.fa \
       /home/centos/data/TEannot/genome_refTEs.fa
# link classification table - not available until TEdenovo finished
docker exec -it repet ln -sf \
       /home/centos/data/TEdenovo/genome_Blaster_GrpRecPil_Map_TEclassif_Filtered/genome_sim_denovoLibTEs_PC_filtered.classif \
       /home/centos/data/TEannot/genome_consensus_classif
