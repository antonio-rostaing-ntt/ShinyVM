#!/bin/bash -i

# The following are documented (and stolen from) here:
#   http://redsymbol.net/articles/unofficial-bash-strict-mode/
#
# In case that link dies, here's the simple version:
# 1) -e means if there's an error, stop execution.
# 2) -u means if we reference an undefined variable, blow up.
# 3) -o pipefail means that if a step in a pipe fails, the whole pipe fails, which in combination with 1) means
#    that the script as a whole fails.

set -euo pipefail

echo "***************"
echo "Installing R..."
echo "***************"
sudo sed -i '$a deb http://cran.es.r-project.org/bin/linux/ubuntu trusty/' /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-get update -y
sudo apt-get install default-jre -y --force-yes
sudo apt-get install r-base -y --force-yes
sudo apt-get install r-base-dev -y --force-yes
sudo su - -c "R -e \"install.packages('codetools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"update.packages(lib.loc='/usr/local/lib/R/site-library', repos='http://cran.rstudio.com/')\""

echo "***************"
echo "Shiny server..."
echo "***************"
sudo apt-get install gdebi-core -y
wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
sudo gdebi shiny-server-1.3.0.403-amd64.deb --n

echo "*************"
echo "R Packages..."
echo "*************"
sudo apt-get install r-cran-plyr r-cran-reshape2 -y
sudo su - -c "R -e \"source('/vagrant/ShinyApp/InstallPackage.R')\""

# Test user shiny have access to R package
# sudo su shiny
# R
# .libPaths()
# .library(shiny)

# R upgrade: http://cran.es.r-project.org/bin/linux/ubuntu/
# Add an entry in /etc/apt/sources.list file
# > deb http://cran.es.r-project.org/bin/linux/ubuntu trusty/
# Then
# > sudo apt-get update
# > sudo apt-get install r-base
# > sudo apt-get install r-base-dev


#export R=/usr/bin
