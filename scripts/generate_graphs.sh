#!/bin/sh

rm -rf *.pdf
for i in `ls *.py`; do
    python3 $i
done
