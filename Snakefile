### STRUCTURAL VARIATION ANALYSIS ###

# author: Lorena Derezanin
# date: 5/11/2020
# run in conda env snakemake 
# snakemake v.5.28

###################################################################################################################

## mice reads mapped to mice reference genome (Mus_musculus.GRCm38) with BWA
# 150 samples in the cohort (6 lines/populations)
# SV caller: svtools(Lumpy + CNVnator)


# Snakefile1 main rules:
# SAMPLES = ["Sample1", "Sample2"]
# snakefiles = "snakefiles/"
# include: snakefiles + "align"
# include: snakefiles + "smoove"

rule all:
input:"/home/fb4/derezanin/sos-fert/20_structural_variants/03_smoove/genotyped_results/paste/cohort.smoove.square.anno.vcf.gz"



REF="/home/fb4/derezanin/sos-fert/reference_genome_ensembl/Mus_musculus.GRCm38.dna.primary_assembly.fa",
BAM1="/home/fb4/derezanin/sos-fert/03_alignments_raw2/merged",
# BAM2="/home/fb4/derezanin/sos-fert/GitHub/WGS_analysis_mmu/batch3/05_alignments_addRG_dedup_bqsr/output"
# EXCLUDE="/home/fb4/derezanin/sos-fert/GitHub/WGS_analysis_mmu/batch3/05_alignments_addRG_dedup_bqsr/output/I34772-L1_S63_L003.sorted.RG.dedup.bqsr.bam"
OUT="/home/fb4/derezanin/sos-fert/20_structural_variants/03_smoove"


# add step for filtering out complex regions and gaps in ref. genome


rule variant_call:

# create list of samples with their paths https://www.biostars.org/p/451548/

input:"$BAM1/{sample}.merged.sorted.dedup.bam"
      # "$BAM2/{sample}.sorted.RG.dedup.bqsr.bam"
   
output:"$OUT/genotyped_results/{sample}_smoove_gt.vcf.gz"

# conda: recreate the env from yml

shell:"""
      conda activate smoove
      export TMPDIR=/home/fb4/derezanin/sos-fert/20_structural_variants/03_smoove
      smoove call --outdir $OUT/genotyped_results/ --excludechroms '~^GL,~^JH' \
      --name {wildcards.sample} --fasta {REF} -p 2 --genotype {input}
      """







## STRUCTURAL VARIANT ANNOTATION ## 



