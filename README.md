# Structural variation analysis in selected mice lines - SOS-FERT project

Identification and functional annotation of genic structural variants in five selected mice lines and a control line. Preprint **"Genomic characterization of world’s longest selection experiment 
in mouse reveals the complexity of polygenic traits"** available at [bioRxiv](https://doi.org/10.1101/2021.05.28.446207).


- 6 mice lines (25 samples per line): two high fertility lines (different physiological pathways), lean (high protein mass) and "obese" line, endurance line, control
- snakemake pipeline for parsing bam files, SV calling and filtering, VEP annotation
- initial SV test run done on 60 samples (50 + 10 re-seq) with genome coverage ~20x
- 150 samples split into low (~5x) and high (~20x) coverage set, SVs inferred primarily from high cov. set




