- [scrnaseq.sh](scrnaseq.sh): A script to use the Nextflow pipeline [scrnaseq](https://nf-co.re/scrnaseq/). This script was made to run on a Sun Grid Engine cluster, however, it can be modified and informative for use on other clusters or on a conventional computer. If you use nf-core/scrnaseq for your analysis, please cite it using this [doi](https://doi.org/10.5281/zenodo.3568187).
    - Input:
        - samplesheet.csv
            - Refer to [scrnaseq](https://nf-co.re/scrnaseq/) for the proper creation of this samplesheet.
        - genomic.fna
            - The appropriate reference file.
        - genomic.gtf
            - The appropriate annotation file.
    - Output:
        - Refer to [scrnaseq-output](https://nf-co.re/scrnaseq/2.4.0/docs/output/).

Alternatively, the pipeline may be run in a tmux window on an interactive computing node. E.g., login to a computing node allocating 16 CPUs with `qrsh -pe smp 16` and run

# Install Nextflow using "Bioconda installation" at https://nf-co.re/docs/usage/installation
source activate env_nf
# Give more memory to Nextflow
NXF_OPTS='-Xms8g -Xmx24g'
# Sincularity cache path
NXF_SINGULARITY_CACHEDIR=/vcu_gpfs2/home/mdozmorov/singularity_cache
# Project directory
DIRIN=/vcu_gpfs2/home/mdozmorov/data/WorkData/Shawn_Wang/2023-09.scRNA-seq
INPUT=${DIRIN}/samplesheet_gene.csv
OUTPUT=${DIRIN}/OUT_gene

nextflow run nf-core/scrnaseq \
    -profile singularity \
    --input ${INPUT} \
    --outdir ${OUTPUT} \
   --protocol 10XV2 \
   --aligner cellranger \
   --genome GRCm38

Use `-resume` parameter to resume partially executed pipeline