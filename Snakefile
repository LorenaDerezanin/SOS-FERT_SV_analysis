### STRUCTURAL VARIATION ANALYSIS ###

# author: Lorena Derezanin
# date: 5/11/2020
# snakemake pipeline
# run in conda env snakemake

###################################################################################################################

## mice reads mapped to mice reference genome () with BWA v.
# 150 samples in the cohort (6 lines/populations)
# SV caller: svtools(Lumpy + CNVnator)


# Snakefile1 main rules:
# SAMPLES = ["Sample1", "Sample2"]
# snakefiles = "snakefiles/"
# include: snakefiles + "align"
# include: snakefiles + "smoove"
# rule all:
# input:
# "smoove/results/genotyped/paste/cohort.smoove.square.anno.vcf.gz",
# "indexcov/index.html" 



REF="/home/fb4/derezanin/sos-fert/reference_genome_ensembl/Mus_musculus.GRCm38.dna.primary_assembly.fa"
GFF=""

rule variant_call:
input:
    "$REF/"
    " "
output:
    ""
shell:
    "svtools {input} | "




## STRUCTURAL VARIANT ANNOTATION ## 



