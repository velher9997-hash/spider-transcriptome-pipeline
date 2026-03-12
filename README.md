# Transcriptome Assembly and Functional Annotation Pipeline 🧬🕷️

## Overview
This repository contains the bioinformatics pipeline used for the *de novo* transcriptome assembly and functional annotation of *Cupiennius chiapanensis*. The workflow integrates Wet Lab sequencing data with Dry Lab computational analysis to identify novel biomolecules (antimicrobial peptides and toxins).

## Tech Stack & Tools Used
* **OS & Environment:** Linux/Ubuntu, High-Performance Computing (HPC) Cluster.
* **Assembly:** Trinity v2.8.4
* **Annotation Pipeline:** Trinotate (Transdecoder, Blastx, Blastp, HMMER/Pfam, SignalP 5.0, TMHMM).
* **Data Processing & Visualization:** R (Base R, UpSet plots for keyword intersections).

## Workflow Description
1. **Quality Control & Assembly:** Fastq sequences were assembled using Trinity. Basic statistics (N50, median contig length) were extracted using `TrinityStats.pl`.
2. **Functional Annotation:** Open Reading Frames (ORFs) were predicted. Homology searches were performed against SwissProt and Pfam databases.
3. **Data Wrangling (R):** The raw Trinotate report (>90,000 rows) was processed in R. Unannotated sequences were filtered out using logical matrices.
4. **Biomolecule Discovery:** A custom R function (`searchWord`) was deployed to intersect genomic data with keywords (Toxin, Venom, Arachnida) to isolate targets of biotechnological interest.

*Note: This repository is a code portfolio representing the transcriptomic workflow utilized during my Master's research at ECOSUR.*
