FROM hub.opensciencegrid.org/osg-jupyter/htc-datascience-notebook:1.1.0

USER root

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y imagemagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER $NB_UID:$NB_GID
