README.md by Brydon Wall

# nf-core rnaseq commands (GRCh38p.14)

[rnaseq](https://nf-co.re/rnaseq/): If you use nf-core/rnaseq for your analysis, please cite it using this [doi](https://doi.org/10.5281/zenodo.1400710).
## Input Files
### Create samplesheet.csv
- Refer to https://nf-co.re/rnaseq

### GRCh38p.14 from NCBI
- Fetch and unzip [GRCh38p.14](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/)
```
mkdir /path/to/GRCh38p.14
cd /path/to/GRCh38p.14
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCF_000001405.40/download?include_annotation_type=GENOME_FASTA,GENOME_GFF&filename=GCF_000001405.40.zip" -H "Accept: application/zip"
unzip GCF_000001405.40.zip
rm GCF_000001405.40.zip
```

## Run rnaseq pipeline
- Adjust settings according to your needs
```
conda activate env_nf # if using conda

nextflow run nf-core/rnaseq 
    --input /path/to/samplesheet.csv \
    --outdir /path/to/rnaseq_output \
    -profile singularity # or docker \
    --fasta /path/to/GRCh38p.14/ncbi_dataset/data/GCF_000001405.40/GCF_000001405.40_GRCh38.p14_genomic.fna \
    --gtf /path/to/GRCh38p.14/ncbi_dataset/data/GCF_000001405.40/genomic.gtf \
    --gff /path/to/GRCh38p.14/ncbi_dataset/data/GCF_000001405.40/genomic.gff \
    --aligner star_rsem \
    -resume
```