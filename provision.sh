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

sudo apt-get update -y

echo "R"
sudo apt-get install r-base -y
sudo apt-get install r-base-dev -y
sudo su - \root -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo su - \root -c "R -e \"update.packages(lib.loc='/usr/local/lib/R/site-library', repos='http://cran.rstudio.com/')\""

echo "Shiny server..."
sudo apt-get install gdebi-core -y
wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
sudo gdebi shiny-server-1.3.0.403-amd64.deb --n

# Test user shiny have access to R package
# sudo su shiny
# R
# .libPaths()
# .library(shiny)
sudo chmod 707 /usr/local/lib/R/site-library
sudo chmod 707 /usr/lib/R/site-library
sudo chmod 707 /usr/lib/R/library
