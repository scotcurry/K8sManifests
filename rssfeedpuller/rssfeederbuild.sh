#! /bin/zsh

cd ${HOME}/Projects/RSSFeedPuller/RSSFeedPuller
docker build --file ${HOME}/K8sManifests/Dockerfile-rssfeedpuller-k8s --platform linux/amd64 --tag docker.io/scotcurry4/rssfeedpuller:${CURRENT_VERSION} .