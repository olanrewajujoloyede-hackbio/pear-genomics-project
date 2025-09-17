# 🍐 Pear Genomics Project (HackBio NGS Internship - Stage 1)

This repository contains my Stage 1 submission for the **HackBio NGS Internship**.  
The project explores whole-genome sequencing (WGS) data of pears to uncover genetic variants that shape important fruit traits such as **sweetness, size, and stone cell content**.  

---

## 📊 Project Overview
Pears have been cultivated for centuries in Asia and Europe, producing diverse varieties with unique flavors and textures.  
Using WGS data, this project aimed to:  

1. **Identify species of pears** studied.  
2. **Perform variant detection** (SNPs and structural variations).  
3. **Highlight candidate variants** linked to nutritional and taste-related traits.  
4. **Discuss how genomics can support food security and crop improvement**.  

---

## 🧬 Dataset
Publicly available SRA datasets were used:  

- **Asian Pear (Dangshansuli):**  
  - SRR32764071  
  - SRR32764072  

- **European Pear (Max Red Bartlett):**  
  - SRR7135493  
  - SRR7135521  

---

## 🛠️ Methods

### 1. Data Acquisition & QC
- Downloaded raw FASTQ files via SRA Explorer.  
- Quality checked using **FastQC** and aggregated with **MultiQC**.  
- Trimmed adapters and low-quality bases with **Trimmomatic**.  

### 2. Mapping & Alignment
- Reads aligned to the pear reference genome with **BWA-MEM**.  
- Alignments processed (sorting, indexing) using **Samtools**.  

### 3. Variant Calling
- **SNPs/Indels** detected with **GATK**.  
- **Structural Variants (SVs)** identified using **Manta**.  
- Variants filtered for quality and coverage depth.  

### 4. Analysis & Annotation
- Compared Asian vs European pear genomes.  
- Identified candidate SNPs/SVs affecting traits like:  
  - **Fruit size**  
  - **Sweetness (sugar metabolism genes)**  
  - **Stone cell content (lignin biosynthesis genes)**  

---

## 🌍 Why It Matters
Understanding the genetic diversity of crops like pears can:  
- Support **breeding programs** for tastier and more nutritious fruits.  
- Improve **crop resilience** in the face of climate change.  
- Contribute to **global food security** by enhancing fruit quality and yield.  

---

## 🎯 Key Takeaway
This project highlights how **bioinformatics bridges DNA and agriculture**—helping us move toward healthier diets and sustainable farming.  

---

## 📌 Project Files
- `report.md` → Full project report (markdown).  
- `scripts/` → Bioinformatics pipeline scripts (QC, alignment, variant calling).  
- `README.md` → This documentation.  

---

## 🔗 Links
- 📖 [LinkedIn Post](https://www.linkedin.com/posts/oloyedeolanrewaju_hackbio-genomics-bioinformatics-activity-7374002715263320064-atlA?utm_source=share&utm_medium=member_desktop&rcm=ACoAAC3XuvsBUbCCdSMtK9XRz4_s4qQyF_tvrO0)  
- 🖼️ [Infographic](A_flowchart_infographic_titled_"Pear_Genomics_Work.png)  

---

## ⚠️ Limitations
- Small sample size (only 2 cultivars compared).  
- Potential **reference genome bias** in alignment.  
- Further **functional validation** is needed to confirm candidate variants.  

---

## 👩‍💻 Author
**Olanrewaju Oloyede**  
HackBio NGS Internship – Stage 1 Participant  
