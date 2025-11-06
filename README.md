# Proyek SQL - Struktur Tabel dan Operasi Database

Proyek ini berfokus pada pengelolaan dan manipulasi database menggunakan SQLite3. Di dalam proyek ini, berbagai file SQL digunakan untuk membuat, memodifikasi, dan mengelola tabel serta data yang ada di dalam database.




## Deskripsi File

- **contain-table.sql**: File ini digunakan untuk menampilkan data atau konten yang ada di dalam tabel.
- **create-table.sql**: File yang digunakan untuk membuat tabel baru di dalam database dengan skema yang telah ditentukan.
- **distinct.sql**: Berisi query untuk menampilkan data yang tidak duplikat dari tabel yang ada.
- **filtering-row.sql**: File ini berisi query untuk menyaring baris-baris data berdasarkan kondisi tertentu.
- **modifikasi-data.sql**: Digunakan untuk melakukan operasi modifikasi terhadap data yang ada di dalam tabel (misalnya, UPDATE atau INSERT).
- **order-by-clause.sql**: Berisi query untuk mengurutkan data berdasarkan kolom tertentu dengan menggunakan klausa `ORDER BY`.
- **pengaturan-tabel.sql**: File yang berisi pengaturan tambahan untuk tabel, seperti menambah atau mengubah kolom.
- **select.sql**: Berisi query SELECT untuk mengambil data dari tabel, biasanya digunakan untuk membaca data.

## Cara Menggunakan

1. **Menjalankan SQL Scripts**  
   Anda dapat menjalankan masing-masing skrip SQL di dalam file `.sql` menggunakan SQLite3 untuk mengelola database. Misalnya, untuk membuat tabel, Anda dapat menjalankan `create-table.sql` di dalam terminal:

   ```bash
   sqlite3 main.db < create-table.sql

