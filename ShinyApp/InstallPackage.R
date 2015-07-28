# Package to install
list.of.packages <- c('bit64',
                 'ggplot2',
                 'segmented',
                 'data.table',
                 'grid',
                 'shiny',
                 'rmarkdown',
				 'RJDBC')
# Update package
update.packages(checkBuilt = TRUE, ask = FALSE, lib.loc='/usr/local/lib/R/site-library', repos='http://cran.rstudio.com/')
update.packages(checkBuilt = TRUE, ask = FALSE, lib.loc='/usr/lib/R/site-library', repos='http://cran.rstudio.com/')
update.packages(checkBuilt = TRUE, ask = FALSE, lib.loc='/usr/lib/R/library', repos='http://cran.rstudio.com/')

# Check for installed packages
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

# Install new packages
if(length(new.packages)) install.packages(new.packages, repos='http://cran.rstudio.com/')
