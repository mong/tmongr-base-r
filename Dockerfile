FROM rocker/r-base:4.1.3

LABEL maintainer "Arnfinn Hykkerud Steindal <arnfinn.steindal@gmail.com>"

# system libraries of general use
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl3-gnutls \
    libcurl4-gnutls-dev \
    libssl-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# basic R functionality
RUN R -e "install.packages(c('remotes'), repos='https://cloud.r-project.org/')"

# install package dependencies
RUN R -e "install.packages(c('shiny', 'shinythemes', 'shinyWidgets', 'dplyr', 'tidyr', 'stringi', 'lazyeval', 'magrittr', 'rlang', 'yaml', 'knitr', 'markdown'))"

CMD ["R"]
