#!/bin/bash

cat -n $1 | sort -uk2 | sort -n | cut -f2- | sed -r '/^\s*$/d' > quotes2.txt

cat quotes2.txt
