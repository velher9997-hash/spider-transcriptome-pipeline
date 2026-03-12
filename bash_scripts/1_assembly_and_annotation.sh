#!/bin/bash
# Pipeline for Transcriptome Assembly and Annotation

# 1. Assembly using Trinity
qsub -l h_vmem=30G -pe thread 6 /home/vegal/bin/run_trinity_v1.sh \
/scratch/vegal/Cupiennius/ output_trinity_Cupiennius \
TraChia1_S36_R1_001.fastq.gz TraChia1_S36_R2_001.fastq.gz \
30 G6 "--min_contig 60 --SS_lib_type RF"

# 2. ORF Prediction using Transdecoder
qsub -l h_vmem=30G -pe thread 6 /home/vegal/bin/run_transdecoder.sh \
/scratch/vegal/Cupiennius/ /scratch/vegal/Cupiennius/output_trinity_Cupiennius/Trinity.fasta

# 3. Sequence Homology (Blastx)
qsub -l h_vmem=8G -pe mpi 8 /home/vegal/bin/run_trinotate_blastx.sh \
/scratch/vegal/Cupiennius/output_trinity_Cupiennius \
/scratch/vegal/Cupiennius/output_trinity_Cupiennius/Trinity.fasta
