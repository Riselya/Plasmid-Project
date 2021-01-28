#https://github.com/biobakery/phylophlan/issues/28

#draft genomes
#http://www.cbs.dtu.dk/public/CGE/databases/CuratedGenomes/bacteria/GCF_000375405.1_ASM37540v1_genomic.fna


### follow setup instructions
##have all assembled fasta files in a folder within wd
##use the conigeration file used in the Tol_02 tutorial on website (tol_config.cfg)


conda create -n "phylophlan" -c bioconda phylophlan=3.0

conda activate phylophlan

phylophlan_write_default_configs.sh phylophlan_configs

# create phylo tree

phylophlan -i Genomes \
--genome_extension .fasta \
-d phylophlan \
-f tol_config.cfg \
--diversity high \
-o output_tol \
--nproc 16 \
--verbose 2>&1 | tee logs/phylophlan.log


### taxonomy

conda install -c bioconda mash # install mash

#put files into folder 'input metagenomic'
#make sure 

phylophlan_metagenomic -i input_metagenomic \
-o output_metagenomic \
--nproc 4 \
-e .fasta \
-n 1 \
-d SGB.Jan19 \
--verbose 2>&1 | tee logs/phylophlan_metagenomic.log


# taxonomy output is in main folder
