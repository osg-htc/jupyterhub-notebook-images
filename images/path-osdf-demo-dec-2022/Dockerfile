FROM hub.opensciencegrid.org/osg-jupyterhub/htc-minimal-notebook:1.3.0

USER root

## Upgrade HTCondor to 10.x.y.

RUN sed -i -e 's/current/10.x-update/' /etc/apt/sources.list.d/htcondor.list \
    && curl https://research.cs.wisc.edu/htcondor/repo/keys/HTCondor-10.x-Key | apt-key add -  \
    && apt-get update \
    && apt-get upgrade -y htcondor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Fix URLs in the HPC Annex scripts.

RUN sed -i -e 's|^WELL_KNOWN_LOCATION_FOR_BINARIES=.*$|WELL_KNOWN_LOCATION_FOR_BINARIES=https://research.cs.wisc.edu/htcondor/tarball/9.x/9.5.4/update/condor-9.5.4-20220207-x86_64_Rocky8-stripped.tar.gz|' \
        /usr/lib/condor/libexec/annex/anvil.sh \
        /usr/lib/condor/libexec/annex/expanse.sh
RUN sed -i -e 's|^WELL_KNOWN_LOCATION_FOR_BINARIES=.*$|WELL_KNOWN_LOCATION_FOR_BINARIES=https://research.cs.wisc.edu/htcondor/tarball/10.x/10.2.0/rc/condor-10.2.0-x86_64_CentOS8-stripped.tar.gz|' \
        /usr/lib/condor/libexec/annex/bridges2.sh
RUN sed -i -e 's|^WELL_KNOWN_LOCATION_FOR_BINARIES=.*$|WELL_KNOWN_LOCATION_FOR_BINARIES=https://research.cs.wisc.edu/htcondor/tarball/9.x/9.5.4/update/condor-9.5.4-20220207-x86_64_CentOS7-stripped.tar.gz|' \
        /usr/lib/condor/libexec/annex/stampede2.sh

USER $NB_UID:$NB_GID
