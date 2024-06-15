

Rstudio worked using apptainer (invoked from wsl2 env!) per README.txt
but docker doesn't work yet.

apptainer execution works (lots of warnings on start notwithstanding);                                                  docker execution for strudio have problem connecting to X server.


apptainer exec docker://ghcr.io/tin6150/rstudio:main bash
# image saved in APPTAINER cache dir. eg
# ~/.apptainer/cache/oci-tmp/25bb8f7cb2aaa876be71cb6099d128bfc09fa8cf6950e816b5c21edd5162dae7



docker pull ghcr.io/tin6150/rstudio:main                                                                                docker run  -it --rm  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/tmp/home  --user=$(id -u):$(id -g) --entrypoint rstudio tin6150/rstudio


older notes below.




cd /global/home/groups/consultsw/sl-7.x86_64/modules
singularity pull --name rstudio.sif docker://ghcr.io/tin6150/rstudio:main

in wsl, docker run like below result in R in text mode only :
docker run -it --rm   ghcr.io/tin6150/rstudio:main --no-save

# duh, cuz rstudio gui app wasn't installed!  it was invoking R

docker run -it --rm --entrypoint=xfe  ghcr.io/tin6150/rstudio:main
# xfe is like far ?
 

~~~~~

r4eta
=====

Container for R with libraries for LBNL Energy Technology Area project
Now with Jupyter Notebook server


Example running R script via Docker
-----------------------------------

# R script inside the container
docker run                -it --entrypoint=Rscript  ghcr.io/tin6150/rstudio:main /opt/gitrepo/hello_world.R


# R script in home dir, bind mounted to container
docker run -v "$PWD":/mnt -it --entrypoint=Rscript  ghcr.io/tin6150/r4eta:master  /mnt/drJin.R                

# running a bash shell, can call R from there
docker run                -it --entrypoint=bash     ghcr.io/tin6150/r4eta:master  


Example running R script via Singularity
----------------------------------------

singularity pull  docker://ghcr.io/tin6150/r4eta:master  
singularity shell docker://ghcr.io/tin6150/r4eta:master  # get bash prompt 
singularity run   docker://ghcr.io/tin6150/r4eta:master  # get R    prompt
singularity exec  docker://ghcr.io/tin6150/r4eta:master  Rscript ./drJin.R                    # R script in current working dir
singularity exec  docker://ghcr.io/tin6150/r4eta:master  Rscript /opt/gitrepo/r4eta/drJin.R   # R script inside container


~~~~~


* cdaca92 (HEAD -> main, origin/main, origin/HEAD) rstudio dependencies conflict with libssl vs libssl3, changing to use ubuntu 20.04 as base and add r-base pkg. fix typo. sp9



  moba:
**^ tin LL486 ~/tin-git-Ctin/rstudio ^**>  docker run  -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/tmp/home  --user=$(id -u):$(id -g) --entrypoint rstudio ghcr.io/tin6150/rstudio:main
[1:0423/095606.230402:FATAL:setuid_sandbox_host.cc(158)] The SUID sandbox helper binary was found, but is not configured correctly. Rather than run without sandboxing I'm aborting now. You need to make sure that /usr/lib/rstudio/chrome-sandbox is owned by root and has mode 4755.


I have no name!@42e6e11425fc:/usr/lib/rstudio$ chmod 4755 chrome-sandbox
chmod: changing permissions of 'chrome-sandbox': Operation not permitted

I have no name!@42e6e11425fc:/usr/lib/rstudio$ chmod u+s chrome-sandbox
chmod: changing permissions of 'chrome-sandbox': Operation not permitted

adding --no-sandbox result in 
Fontconfig error: No writable cache directories

**^ tin LL486 ~/tin-git-Ctin/rstudio ^**>  docker run  -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/tmp/home  --user=$(id -u):$(id -g) --entrypoint rstudio ghcr.io/tin6150/rstudio:main --no-sandbox
[1:0423/100512.552822:ERROR:bus.cc(399)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
Fontconfig error: No writable cache directories

zorin had the same problem. 




# vim: nosmartindent tabstop=4 noexpandtab shiftwidth=4 paste
