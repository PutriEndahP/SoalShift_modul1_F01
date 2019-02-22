# SoalShift_modul1_F01

## Soal 1
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. (Hint: Base64, Hexdump)

	Langkah awal yang dilakukan adalah men-download file nature.zip. Kemudian membuat file nano soal1.sh yang berisi source code seperti ini :

```javascript
 #!/bin/bash

unzip /home/putri/sisop/nature.zip -d /home/putri/sisop
mkdir /home/putri/sisop/nature_gambar

i="1"
for var in /home/putri/sisop/nature/*.jpg
do
base64 -d $var | xxd -r > /home/putri/sisop/nature_gambar/$i.jpg
i=$(($i + 1))
done
```
```
Crontab : 14 14 14 2 * /bin/bash /home/putri/sisop/soal1.sh
                14 14 * 2 5 /bin/bash /home/putri/sisop/soal1.sh
```

	Dari source code diatas, file nature.zip di unzip terlebih dahulu dan hasil file unzip an nya di letakkan pada file sisop. Kemudian membuat folder bernama nature_gambar untuk menyimpan file gambar yang sudah terbuka.

	Di iterisas i=1. Untuk semua file gambar pada file nature maka di lakukan base64 kemudian di hexdump agar file yang terdapat pada file tersebut bisa terbuka, kemudian file yang sudah bisa terbuka di simpan ke dalam folder bernama nature_gambar. Kemudian lakukan looping agar banyak gambar yang terdapat pada file tersebut dapat melakukan perintah.

	Agar program dapat berjalan sesuai dengan perintah soal, maka diberikan crontab pada bash cript tersebut. Crontab pertama yaitu semua file dapat terbuka pada pukul 14:14 pada tanggal 14 Februari. Dan crontab kedua yaitu semua file dapat terbuka pada hari Jumat pada bulan Februari.
