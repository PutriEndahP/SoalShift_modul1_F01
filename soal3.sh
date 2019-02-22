#!/bin/bash

i=1
no=1
while [ $i -ne 0 ]
do
if [[ -f /home/putri/sisop/hasilno3/password$no.txt ]]; then
   no=$((no + 1))
   else
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/putri/sisop/hasilno3/password$no.txt
i=0
fi
done
