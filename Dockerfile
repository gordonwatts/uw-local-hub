FROM jupyterhub/k8s-singleuser-sample:0.9.0
# Get the latest image tag at:
# https://hub.docker.com/r/jupyter/minimal-notebook/tags/
# Inspect the Dockerfile at:
# https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook/Dockerfile

# install additional package...
USER root

RUN sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN sudo apt-get update
RUN sudo apt-get install -y kubectl
RUN sudo apt-get install -y vim

# Jupyter config
# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
# RUN jupyter lab build

# Reset to be "safe"
USER nobody
