




cd /global/home/groups/consultsw/sl-7.x86_64/modules
singularity pull --name rstudio.sif docker://ghcr.io/tin6150/rstudio:main

in wsl, docker run like below result in R in text mode only :
docker run -it --rm   ghcr.io/tin6150/rstudio:main --no-save
 


# vim: nosmartindent tabstop=4 noexpandtab shiftwidth=4 paste
