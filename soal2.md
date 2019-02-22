# SoalShift_modul1_F01

## Soal 2
Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa :

a.	Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.

b.	Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.

c.	Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

	Langkah pertama yaitu buatlah file nano soal2.sh yang berisi :

```javascript
#!/bin/bash

echo "Nomor 2a" 
awk -F ',' '{if($7=='2012') p[$1]+=$10} END {for(hasil in p) {print hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1

echo "Nomor 2b"
awk -F ',' '{if($7=='2012' && $1=="United States") p[$4]+=$10} END {for(hasil in p) {print p[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'

echo "Nomor 2c"
echo "*Personal Accessories*"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Personal Accessories") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'
echo "*Camping Equipment*"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Camping Equipment") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'
echo "*Outdoor Protection*"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Outdoor Protection") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'
```
	Point a : Diminta untuk menunjukkan negara dengan penjualan(quantity) terbanyak pada tahun 2012. Berdasarkan source code diatas, cari dulu tahun pada kolom 7 yang menunjukkan tahun ‘2012’ setelahnya cari quantity pada kolom 10 di setiap negara pada kolom 1, kemudian simpan ke variabel p. Kemudian isi dari variabel p di simpan ke variabel hasil. Print variabel hasil yang akan di urutkan berdasarkan banyaknya quantity dan ambil baris yang pertama saja karena merupakan negara dengan quantity terbanyak.

	Point b : Diminta untuk menunjukkan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a. Berdasarkan source code diatas, cari product line pada tahun ‘2012’ dan negara atau kolom 1 menunjukkan ‘United States’. Kemudian kelompokkan quantity berdasarkan product line nya yang disimpan di variabel p. Kemudian isi dari variabel p di simpan ke variabel hasil. Print variabel p[hasil] yang akan menghasilkan kolom quantity dan hasil yang merupakan nama dari product line tersebut yang terdiri dadi 2 kolom. Kemudian di sort dan diambil number row yang 3 teratas lalu print kolom 2 dan 3 yang merupakan kolom nama product line tersebut.

	Point c : Diminta untuk menunjukkan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b. Cara membuat source code nya sama dengan point b, hanya saja pada point c ini di sendiri2 kan per product line nya.