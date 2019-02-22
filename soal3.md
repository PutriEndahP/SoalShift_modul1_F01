# SoalShift_modul1_F01

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

