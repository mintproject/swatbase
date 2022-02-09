FROM rocker/r-base
LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/mintproject" \
      maintainer="Daniel Fuka <drfuka@vt.edu>"

RUN apt update \
  && apt-get install -y gzip curl wget subversion jags
RUN apt-get -y --fix-missing install vim libxml2-dev libz-dev gdal-bin libudunits2-dev libxt6 libgdal-dev mpich mdbtools
RUN apt-get clean
RUN mkdir -p /mintswat/MINTSWATmodel_input
RUN mkdir -p /mintswat/MINTSWATmodel_output

RUN Rscript -e 'if (!require("pacman")) install.packages("pacman"); pacman::p_load(lubridate,rnoaa,ggplot2,moments,operators,topmodel,DEoptim,XML,data.table,RSQLite,argparse,stringi,stringr,sqldf,readr,rgeos,rgdal,sf,readr,tools,diffobj); system("svn checkout svn://scm.r-forge.r-project.org/svnroot/ecohydrology/"); install.packages(c("ecohydrology/pkg/EcoHydRology/","ecohydrology/pkg/SWATmodel/"),repos = NULL)' 
WORKDIR /mintswat
