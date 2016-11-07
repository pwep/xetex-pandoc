FROM debian:latest
MAINTAINER Peter Phillips <peter.phillips@cumbria.ac.uk>

LABEL version="1.18.0"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  curl \
  make \
  git \
# pandoc \
# pandoc-citeproc \
  ca-certificates \
  lmodern \
  texlive-latex-base \
# texlive-generic-extra \
# texlive-fonts-extra \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-lang-english \
  latex-xcolor \
  texlive-math-extra \
  texlive-latex-extra \
  texlive-bibtex-extra \
  biber \
  fontconfig \
  texlive-xetex \
# python and gcc for pandoc filters
  python-pip python-dev gcc && \
  easy_install -U setuptools && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
RUN curl -s -S -L -O https://github.com/jgm/pandoc/releases/download/1.18/pandoc-1.18-1-amd64.deb && \
  dpkg -i pandoc-1.18-1-amd64.deb && \
  rm pandoc-1.18-1-amd64.deb

# Add filters for pandoc 
RUN pip install pandoc-fignos
RUN pip install pandoc-eqnos
RUN pip install pandoc-tablenos

# Export the output data
WORKDIR /data
VOLUME ["/data"]
