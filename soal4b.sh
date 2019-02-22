#!/bin/bash

echo $1

#mengambil jam dijalankannya command
waktu=`echo $1 | awk -F: '{print $1}'`
#mengkonversikan string menjadi int
waktu=`echo "$waktu" | bc`
waktu=$(($waktu-1))

#batas bawah (a jadi apa) huruf kecil
kecila=$((122-$waktu))
if [ $kecila -gt 122 ]
then
    kecila=97
fi
kecila=$(printf \\$(printf '%03o' $kecila))
#batas atas huruf kecil
kecilb=$(printf '%d' "'$kecila")
kecilb=$(($kecilb-1))
if [ $kecilb -lt 97 ]
then
    kecilb=122
fi
kecilb=$(printf \\$(printf '%03o' $kecilb))

#batas bawah (A jadi apa) huruf besar
besara=$((90-$waktu))
if [ $besara -gt 90 ]
then
    besara=65
fi
besara=$(printf \\$(printf '%03o' $besara))
#batas atas huruf besar
besarb=$(printf '%d' "'$besara")
besarb=$(($besarb-1))
if [ $besarb -lt 65 ]
then
    besarb=90
fi
besarb=$(printf \\$(printf '%03o' $besarb))

jam=`echo $1 | awk -F: '{print $1}'`
menit=`echo $1 | awk '{print $1}' | awk -F: '{print $2}'`
tanggal=`echo $1 | awk '{print $2}' | awk -F- '{print $1}'`
bulan=`echo $1 | awk '{print $2}' | awk -F- '{print $2}'`
tahun=`echo $1 | awk '{print $2}' | awk -F- '{print $3}' | awk -F. '{print $1}'`

#and tinggal di shift dan save
cat "$jam:$menit $tanggal-$bulan-$tahun".txt | tr [a-z] ["$kecila"-za-"$kecilb"] | tr [A-Z] ["$besara"-ZA-"$besarb"] > "$jam:$menit $tanggal-$bulan-$tahun-decrypted".txt

