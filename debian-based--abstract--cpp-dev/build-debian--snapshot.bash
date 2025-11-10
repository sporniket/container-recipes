#!/bin/bash

source ./build-debian.config

./build.bash debian "${CONFIG_BASE_VERSION_TAG}" "${CONFIG_SEMVER_NUMBER}-$(date +%Y-%m-%d--%H-%M-%S)"
