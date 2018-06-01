#!/usr/bin/env bash

set -e

packer build \
  docker-ami.json | tee packer_output.txt

cat tail -n 2 packer_output.txt > packer_ami.tfvars

#cat packer_output.txt | tail -n 2 \
#  | sed '$ d' \
#  | sed "s/us-east-1: /packer_built_docker_ami = \"/" \
#  | sed -e 's/[[:space:]]*$/\"/' > packer_ami.tfvars
#  | > packer_ami.tfvars

#tail -2 packer_output.txt | head -2 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }' > sudo ami.txt

cat packer_ami.tfvars
