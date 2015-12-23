#!/bin/bash

# Read the Serials file to get the latest serial.
# Used to build the CA server crt file name
serial="$(grep -A1 'serial' serial.txt | grep -v 'serial')"
echo $serial
ca_server="ca-gxust$serial"
echo $ca_server

openssl genrsa -des3 -out $ca_server.key 4096
openssl req -new -x509 -days 365 -key $ca_server.key -out $ca_server.crt

# Secure permissions
chmod 400 $ca_server.key
