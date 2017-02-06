#!/bin/bash

set -u
set -e

# This is a key to be used for connecting to the Gitlab server
GITLAB_KEY="${gitlab_runners_key}"

# Where to register
GITLAB_URL="https://gitlab.com/ci"

# Executor (usually we want docker)
GITLAB_EXECUTOR="docker"

# Runner name
RUNNER_NAME="AWS runner"

# Default docker image
DOCKER_IMAGE="ruby:latest"

# Insecurely install docker
curl -sSL https://get.docker.com/ | sudo sh

# Insecurely install Gitlab multi runner
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash

sudo apt-get update
sudo apt-get install -y gitlab-ci-multi-runner

# Register GitLab runner
sudo gitlab-ci-multi-runner register -n --registration-token "$GITLAB_KEY" --url "$GITLAB_URL" --executor "$GITLAB_EXECUTOR" --name "$RUNNER_NAME" --docker-image "$DOCKER_IMAGE"


