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

## Soal 3
Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut :

a.	Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt 

b.	Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.

c.	Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.

d.	Password yang dihasilkan tidak boleh sama.

	Langkah pertama yaitu buatlah file nano soal3.sh yang berisi :

```javascript
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
```
	Berdasarkan source code diatas, diinisialisasi variabel i=1 dan variabel no=1, kemudian dimana i != 0 maka jika misal pada folder hasilno3 terdapat password1.txt kemudian akan meng create password.txt baru dengan format $no + 1, maka jika password1.txt sudah ada maka akan create password2.txt. Tetapi jika password 1 tidak ada maka buat password baru diambil dari urandom abjad a-z atau 0-9 atau huruf besar dan kecil, dimana hanya satu baris saja yang diambil dan tidak boleh lebih dari 12 karakter, kemudian password tersebut disimpan di folder hasilno3. Kemudian iterasi i=0 adalah untuk menghetikan looping agar tidak terus menerus berjalan. 
