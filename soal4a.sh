#!/bin/bash

#mengambil jam dijalankannya command
waktu=`date "+%X" | awk -F: '{print $1}'`
#mengkonversikan string menjadi int
waktu=`echo "$waktu" | bc`

#batas bawah (a jadi apa) huruf kecil
kecila=$(($waktu+97)) 
kecila=$(printf \\$(printf '%03o' $kecila)) #untuk mengkonversi dari asci ke angka
#batas atas huruf kecil
kecilb=$(printf '%d' "'$kecila")
kecilb=$(($kecilb-1))
if [ $kecilb -lt 97 ]
then
    kecilb=122
fi
kecilb=$(printf \\$(printf '%03o' $kecilb))

#batas bawah (A jadi apa) huruf besar
besara=$(($waktu+65))
besara=$(printf \\$(printf '%03o' $besara)) #mengkonversi asci ke angka biasa
#batas atas huruf besar
besarb=$(printf '%d' "'$besara")
besarb=$(($besarb-1))
if [ $besarb -lt 65 ]
then
    besarb=90
fi
besarb=$(printf \\$(printf '%03o' $besarb))

jam=`date "+%X" | awk -F: '{print $1}'`
menit=`date "+%X" | awk -F: '{print $2}'`
tanggal=`date | awk '{print $3}'`
bulan=`date | awk '{print $2}'`
tahun=`date | awk '{print $6}'`

#and tinggal di shift dan save
cat /var/log/syslog | tr [a-z] ["$kecila"-za-"$kecilb"] | tr [A-Z] ["$besara"-ZA-"$besarb"] > "$jam:$menit $tanggal-$bulan-$tahun".txt

