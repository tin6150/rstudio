#!/bin/sh


apt-get -y --quiet install apt-file 
apt-file update 

    echo '==================================================================' 
    echo "install for R" 
    echo '==================================================================' 
    apt-get -y --quiet install r-base r-base-dev r-base-html

## install rstudio


    echo '==================================================================' 
    echo "install for rstudio GUI (Qt)" 
    echo '=================================================================='
    #-- rstudio dont seems to exist in Debian bullseye/sid :/
    #-- apt-get --quiet install rstudio  ;\
    apt-get -y --quiet install r-cran-rstudioapi libqt5gui5 libqt5network5  libqt5webenginewidgets5 qterminal net-tools 
    apt-get -y --quiet install xcb




mkdir -p Downloads &&  cd Downloads 
# wget --quiet https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5033-amd64.deb  -O rstudio4deb10.deb ;\
wget --quiet https://download1.rstudio.org/electron/focal/amd64/rstudio-2023.12.1-402-amd64.deb -O rstudio4deb10.deb 
echo $?
apt-get -y --quiet install ./rstudio4deb10.deb    
echo $?
echo "==================================="


# xfe  is far?  or xfce file manager?

    apt-get install -y --quiet xfe 
    apt-get install -y --quiet mousepad 
    apt-get install -y --quiet xterm  x11-xserver-utils x11-apps 



date

# cd /
