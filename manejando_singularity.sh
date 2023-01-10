#!/bin/bash -u

# Función auxiliar para ejecutar los comandos
function comandosSL {
	prefix=""
	# Comprobamos si hay un segundo argumento (no haber indica que es local)
	# Cargamos los modulos necesarios para ejecutar notebook
	if [[ -z $2 ]]; then
		module load anaconda/2020.11
	else
		#module load singularity
		prefix="singularity run $2"
	fi

	# Ejecutamos los comandos en $1
	echo "Ejecutando comandos en $1:"
	echo

	# a) Comando "hostname"
	echo "Ejecutando hostname:" $($prefix hostname)
	echo

	# b) Comando "cat /etc/os-release"
	echo "Ejecutando cat /etc/os-release:" $($prefix cat /etc/os-release) 
	echo

	# c) Comando "pwd"
	echo "Ejecutando pwd:" $($prefix pwd)
	echo

	# d) Comando "ls -l /home"
	echo "Ejecutando ls -l /home:" $($prefix ls -l /home)
	echo

	# e) Comando "python --version"
	echo "Ejecutando python --version:" $($prefix python --version)
	echo

	#comando="ipython ./source/kmer-solution.ipynb"
	#execCommand ${comando} $prefix

	# f) Comando "ipython kmer-solution.ipynb"
	echo "Ejecutando notebook kmer-solution.ipynb:" $($prefix ipython ./source/kmer-solution.ipynb)
	echo

	# Quitamos los modulos cargados
	module unload anaconda/2020.11
}


# Ejecutamos los comandos en ibsen
comandosSL "ibsen"

# Ejecutamos los comandos en singularity
comandosSL "singularity" "./singularity/my-python.sif"
