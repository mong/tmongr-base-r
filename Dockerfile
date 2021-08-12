FROM rocker/r-base:4.1.1

LABEL maintainer "Arnfinn Hykkerud Steindal <arnfinn.steindal@gmail.com>"

# system libraries of general use
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-gnutls-dev=7.74.\* \
    libssl-dev=1.1.\* \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# basic R functionality
RUN R -e "install.packages(c('remotes'), repos='https://cloud.r-project.org/')"

# install package dependencies
RUN R -e "install.packages(c('shiny', 'shinythemes', 'shinyWidgets', 'dplyr', 'tidyr', 'stringi', 'lazyeval', 'magrittr', 'rlang', 'yaml', 'markdown'))"

CMD ["R"]
