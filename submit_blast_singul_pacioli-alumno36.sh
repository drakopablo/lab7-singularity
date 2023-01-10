#!/bin/bash -u
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno36/lab7
#SBATCH -J advanced-lab7
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE
#SBATCH --mail-user=pablo.guillen1@um.es

# Cargamos los modulos necesarios
module load singularity

# Descomprimimos la BBDD
gzip -d -k zebrafish.1.protein.faa.gz

# Ejecutamos los comandos de Singularity
singularity run blast_2.9.0--pl526h3066fca_4.sif makeblastdb -in zebrafish.1.protein.faa -dbtype prot

singularity run blast_2.9.0--pl526h3066fca_4.sif blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results-blast.txt

# Quitamos los modulos cargados
module unload singularity
