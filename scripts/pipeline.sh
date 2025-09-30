#!/bin/bash
# Pipeline for Pear Genomics Project (HackBio Internship - Stage 1)

# Create directories
mkdir -p data qc_results trimmed alignments variants

# Step 1: Download data
# Replace SRR IDs with actual pear datasets
fastq-dump --split-files -O data/ SRR32764071
fastq-dump --split-files -O data/ SRR32764072
fastq-dump --split-files -O data/ SRR7135493
fastq-dump --split-files -O data/ SRR7135521

# Step 2: Quality Control
fastqc data/*.fastq -o qc_results/
multiqc qc_results -o qc_results/

# Step 3: Trimming
for file in data/*_1.fastq
do
    base=$(basename $file _1.fastq)
    trimmomatic PE \
        data/${base}_1.fastq data/${base}_2.fastq \
        trimmed/${base}_1_paired.fastq trimmed/${base}_1_unpaired.fastq \
        trimmed/${base}_2_paired.fastq trimmed/${base}_2_unpaired.fastq \
        SLIDINGWINDOW:4:20 MINLEN:50
done

# Step 4: Alignment
bwa index pear_reference.fasta
for file in trimmed/*_1_paired.fastq
do
    base=$(basename $file _1_paired.fastq)
    bwa mem pear_reference.fasta \
        trimmed/${base}_1_paired.fastq trimmed/${base}_2_paired.fastq \
        | samtools view -bS - | samtools sort -o alignments/${base}.bam
    samtools index alignments/${base}.bam
done

# Step 5: Variant Calling
gatk HaplotypeCaller \
    -R pear_reference.fasta \
    -I alignments/Dangshansuli.bam \
    -O variants/Dangshansuli.g.vcf.gz \
    -ERC GVCF

gatk HaplotypeCaller \
    -R pear_reference.fasta \
    -I alignments/MaxRedBartlett.bam \
    -O variants/MaxRedBartlett.g.vcf.gz \
    -ERC GVCF

gatk CombineGVCFs \
    -R pear_reference.fasta \
    --variant variants/Dangshansuli.g.vcf.gz \
    --variant variants/MaxRedBartlett.g.vcf.gz \
    -O variants/combined.g.vcf.gz

gatk GenotypeGVCFs \
    -R pear_reference.fasta \
    -V variants/combined.g.vcf.gz \
    -O variants/pear_variants.vcf.gz
