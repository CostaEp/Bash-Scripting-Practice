#!/bin/bash

# Generate 5 random passwords (using seq)
# | cut -c -12 shows only the first 12 characters
# This password includes all symbols

for i in $(seq 1 5); do
    openssl rand -base64 12 | cut -c -12
done