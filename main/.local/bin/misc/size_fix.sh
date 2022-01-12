#!/bin/sh

i=1
until [ ${i} -eq 12500 ]; do
    :
    i=$((${i} + 1))
done
"$@"
