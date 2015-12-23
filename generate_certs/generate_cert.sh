#!/bin/bash

# Read the Serials file to get the latest serial.
# Used to build the CA server crt file name
serial="$(grep -A1 'serial' serial.txt | grep -v 'serial')"
echo $serial
ca_server="ca-gxust$serial"

read -p "Enter url of server: " server
echo "Generating key and csr request for $server "
echo "Generating key..."
openssl genrsa -out $server.key 4096
echo "Generating CSR..."
openssl req -new -key $server.key -out $server.csr

echo "Signing Server: $server with CA"

openssl x509 -req -days 365 -in $server.csr -CA $ca_server.crt -CAkey $ca_server.key -set_serial $serial -out $server.crt

# Ensure permissions for the keys are secure
chmod 400 $server.key

echo "Completed..."
