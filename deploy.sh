#!/bin/env bash
#SCRIPT=$(realpath "$0")
#FULLPATH=$(dirname "$SCRIPT")
SITE="${PWD}"
docker run --rm -v $SITE:/site hugo-builder hugo

