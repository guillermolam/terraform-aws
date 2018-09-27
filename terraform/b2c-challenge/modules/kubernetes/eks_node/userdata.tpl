#!/bin/bash -xe

route add -net 10.169.0.0 netmask 255.255.0.0 gw 10.175.0.199
route add -net 0.0.0.0/0 gw 10.175.0.199

CA_CERTIFICATE_DIRECTORY=/etc/kubernetes/pki
CA_CERTIFICATE_FILE_PATH=$CA_CERTIFICATE_DIRECTORY/ca.crt

