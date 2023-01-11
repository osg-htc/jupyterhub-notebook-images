FROM hub.opensciencegrid.org/osg-jupyterhub/htc-minimal-notebook:1.4.0

USER root

## Upgrade HTCondor to 10.x.y.

RUN sed -i -e 's/current/10.x-update/' /etc/apt/sources.list.d/htcondor.list \
    && curl https://research.cs.wisc.edu/htcondor/repo/keys/HTCondor-10.x-Key | apt-key add -  \
    && apt-get update \
    && apt-get upgrade -y htcondor patch \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    #
    && python3 -m pip install -U --no-cache-dir \
          htcondor==$(condor_version | head -n1 | cut -d " " -f 2)

## Fix URLs in the HPC Annex scripts.

RUN sed -i -e 's|^WELL_KNOWN_LOCATION_FOR_BINARIES=.*$|WELL_KNOWN_LOCATION_FOR_BINARIES=https://research.cs.wisc.edu/htcondor/tarball/9.x/9.5.4/update/condor-9.5.4-20220207-x86_64_Rocky8-stripped.tar.gz|' \
        /usr/lib/condor/libexec/annex/anvil.sh \
        /usr/lib/condor/libexec/annex/expanse.sh
RUN sed -i -e 's|^WELL_KNOWN_LOCATION_FOR_BINARIES=.*$|WELL_KNOWN_LOCATION_FOR_BINARIES=https://research.cs.wisc.edu/htcondor/tarball/10.x/10.2.0/rc/condor-10.2.0-x86_64_CentOS8-stripped.tar.gz|' \
        /usr/lib/condor/libexec/annex/bridges2.sh
RUN sed -i -e 's|^WELL_KNOWN_LOCATION_FOR_BINARIES=.*$|WELL_KNOWN_LOCATION_FOR_BINARIES=https://research.cs.wisc.edu/htcondor/tarball/9.x/9.5.4/update/condor-9.5.4-20220207-x86_64_CentOS7-stripped.tar.gz|' \
        /usr/lib/condor/libexec/annex/stampede2.sh

## Patch the annex creation script.

COPY annex_create.patch /tmp/annex_create.patch
RUN cd / && patch -p0 < /tmp/annex_create.patch

USER $NB_UID:$NB_GID

## Upgrade JupyterLab.

RUN conda install -y jupyterlab==3.4.8

## Install a Juypter extension for browser notifications.
## Reference: https://parulpandey.com/2021/02/06/enabling-notifications-in-your-jupyter-notebooks-for-cell-completion/

RUN python3 -m pip install git+https://github.com/cphyc/jupyter-notify.git
