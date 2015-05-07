# Package to install
list.of.packages <- c('bit64',
                 'ggplot2',
                 'segmented',
                 'data.table',
                 'grid',
                 'shiny',
                 'rmarkdown')

# Check for installed packages
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

# Install new packages
if(length(new.packages)) install.packages(new.packages, repos='http://cran.rstudio.com/')