FROM rocker/r-base

LABEL maintainer "Arnfinn Hykkerud Steindal <arnfinn.steindal@gmail.com>"

# system libraries of general use
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev

# basic R functionality
RUN R -e "install.packages(c('remotes'), repos='https://cloud.r-project.org/')"

# install package dependencies
RUN R -e "install.packages(c('shiny', 'shinythemes', 'shinyWidgets', 'dplyr', 'tidyr', 'stringi', 'lazyeval', 'magrittr', 'rlang', 'yaml', 'markdown'))"

ARG GITHUB_PAT

RUN R -e "remotes::install_github('rstudio/shiny')"

CMD ["R"]
