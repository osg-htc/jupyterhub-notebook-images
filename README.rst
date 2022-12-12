Notebooks for JupyterHub
========================

These images_ are versions of the `Jupyter Docker Stacks`_ images customized
for specific courses, demos, trainings, tutorials, etc.

.. _images: images/
.. _Jupyter Docker Stacks: https://jupyter-docker-stacks.readthedocs.io/


Development
-----------

Run `<build-and-push.sh>`_ as necessary to build and push the images_ in
this repository. Because these are "custom" images, the assumption is that
they are one-off builds and thus would not benefit from GitHub Actions.

This project uses pre-commit_ to ensure commits meet minimum requirements:

1. Install Poetry_.

2. Run ``poetry update`` to install dependencies.

3. Run ``poetry run pre-commit install`` to install the Git hooks.

.. _Poetry: https://python-poetry.org/
.. _pre-commit: https://pre-commit.com/
