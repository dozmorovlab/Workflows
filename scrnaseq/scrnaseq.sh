# scrnaseq.sh
# Nextflow script for analyzing scRNA-seq
# Brydon Wall

# If you use nf-core/scrnaseq for your analysis, please cite it using the following doi: https://doi.org/10.5281/zenodo.3568187
# Refer to https://nf-co.re/scrnaseq/ for additional documentation on scrnaseq

# Replace the following with desired settings for your cluster / computer or remove
#!/usr/bin/env bash
#$ -cwd
#$ -S /bin/bash
#$ -N name_of_job
#$ -e ./scrnaseq_errors.txt
#$ -o ./scrnaseq_output.txt
#$ -M your_email@email.com
#$ -m abe
#$ -pe smp 8
#$ -l mem_free=12G

# Input Files
input="./samplesheet.csv" # Create the samplesheet.csv - see https://nf-co.re/scrnaseq/
fasta="./genomic.fna" # Replace with appropriate reference file
gtf="./genomic.gtf" # Replace with appropriate annotation file

# Run nextflow pipeline
# You can use other settings according to your needs
conda "activate" "env_nf" # Comment out if not using conda
nextflow "run" "nf-core/scrnaseq" \
    -profile "singularity" \
   --input "$input"\
   --fasta "$fasta"\
   --gtf "$gtf"\
   --protocol "10XV2"\
   --aligner "cellranger"\
   --outdir "./output"