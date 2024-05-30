FROM hub.opensciencegrid.org/osg-jupyterhub/htc-datascience-notebook:3.1.0

USER root

# Install RStudio
#     (https://posit.co/download/rstudio-server/)
# and make it easy to access
#     (https://github.com/jupyterhub/jupyter-rsession-proxy).

RUN true \
    && apt-get update -y \
    && apt-get install -y r-base \
    && wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.12.1-402-amd64.deb \
    && apt-get install -y ./rstudio-server-2023.12.1-402-amd64.deb \
    && rm -f rstudio-server-2023.12.1-402-amd64.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && true

USER $NB_UID:$NB_GID

RUN pip install --no-cache-dir jupyter-rsession-proxy
