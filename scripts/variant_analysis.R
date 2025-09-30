# variant_analysis.R
# R script for analyzing variants in pear genomics project

# Load libraries
library(VariantAnnotation)
library(ggplot2)

# Input VCF file
vcf_file <- "variants/combined.vcf.gz"
vcf <- readVcf(vcf_file, "hg19")  # replace "hg19" with pear genome build if available

# Summarize variant calls
summary(vcf)

# Extract SNPs only
snps <- subset(vcf, isSNV(vcf))

# Plot SNP quality distribution
qual <- info(snps)$QUAL
qplot(qual, bins = 50, main = "SNP Quality Distribution")

# Save filtered variants
filtered <- snps[qual > 30]  # keep high-quality variants
writeVcf(filtered, "variants/high_quality_snps.vcf.gz")
