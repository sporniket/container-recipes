#!/bin/bash

source ./build-ubuntu.config

./build.bash ubuntu "${CONFIG_BASE_VERSION_TAG}" "${CONFIG_SEMVER_NUMBER}"
