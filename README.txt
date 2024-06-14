R & Rstudio containerization
============================


unofficial containerization of R & Rstudio.  

with additional packages in common request in Savio HPC.
Rstuio hopefully work in Viz/GUI login node.


apptainer pull --name rstudio.SIF docker://ghcr.io/tin6150/rstudio:main
apptainer exec rstudio.SIF  rstudio    # GUI
apptainer exec rstudio.SIF  R          # text-based R session






Text Terminal based run
========================

Examples for using the singularity container
--------------------------------------------

Pull the container from the cloud ::
	apptainer pull --name rstudio.SIF docker://ghcr.io/tin6150/rstudio:main

Test R ::
	apptainer exec rstudio.SIF /usr/bin/Rscript --version

Run R interactively ::
        ./rstudio.SIF
        q() # exit R and container session.


Interact with the container, run bash, R, Rscript INSIDE the container ::
        apptainer exec  rstudio.SIF  bash
        ls # current working directory should be bind mounted
        R  # run R interactively, use q() to quit, return back to shell INSIDE the container
        Rscript hello_world.R  # invoke an R script
        exit # exit the container, return to host prompt


Run R script in "batch mode", find out what version it is ::
        apptainer exec rstudio.SIF /usr/bin/Rscript --version


Run Rscript with a specific command specified on the command line [ library() ] ::
        apptainer exec rstudio.SIF /usr/bin/Rscript -e 'library()'


Run Rscript invoking a script file.   
This is a bit more elaborate as the container need to 
map (bind) the file system in the outside to the inside of the container.  
- map the current dir (.) on host to /mnt on the container.  
- Output is send to current dir on the host ( > output.txt) ::
        apptainer exec --bind  .:/mnt  rstudio.SIF  /usr/bin/Rscript  /mnt/hello_world.R > output.txt



Repo info
---------

* source:            https://github.com/tin6150/rstudio
* github container:  https://ghcr.io/tin6150/rstudio



