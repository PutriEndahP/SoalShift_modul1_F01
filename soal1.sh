#!/bin/bash

unzip /home/putri/sisop/nature.zip -d /home/putri/sisop
mkdir /home/putri/sisop/nature_gambar

i="1"
for var in /home/putri/sisop/nature/*.jpg
do
base64 -d $var | xxd -r > /home/putri/sisop/nature_gambar/$i.jpg
i=$(($i + 1))
done
