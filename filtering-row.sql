-- Contoh penggunaan klausa WHERE untuk memfilter data berdasarkan kondisi tertentu

-- Menampilkan data karyawan dengan gaji lebih dari 14.000
SELECT
  employee_id,      -- menampilkan ID karyawan
  first_name,       -- menampilkan nama depan
  last_name,        -- menampilkan nama belakang
  salary            -- menampilkan gaji
FROM
  employees         -- dari tabel employees
WHERE
  salary > 14000    -- hanya karyawan dengan gaji lebih dari 14.000 yang ditampilkan
ORDER BY
  salary DESC;      -- hasil diurutkan dari gaji tertinggi ke terendah


-- Menampilkan data karyawan dengan nama belakang 'Chen'
SELECT
  employee_id,      -- menampilkan ID karyawan
  first_name,       -- menampilkan nama depan
  last_name         -- menampilkan nama belakang
FROM
  employees
WHERE
  last_name = 'Chen';  -- hanya menampilkan karyawan yang nama belakangnya 'Chen'


-- Menampilkan data karyawan yang direkrut pada atau setelah tanggal 1 Januari 1999
SELECT
  first_name,        -- menampilkan nama depan
  last_name,         -- menampilkan nama belakang
  hire_date          -- menampilkan tanggal perekrutan
FROM
  employees
WHERE
  hire_date >= '1999-01-01'  -- hanya karyawan yang direkrut pada/ setelah 1 Jan 1999
ORDER BY
  hire_date DESC;    -- hasil diurutkan dari yang paling baru direkrut


-- Menampilkan data karyawan yang direkrut pada tahun 1999
SELECT
  first_name,        -- menampilkan nama depan
  last_name,         -- menampilkan nama belakang
  hire_date          -- menampilkan tanggal perekrutan
FROM
  employees
WHERE
  EXTRACT(YEAR FROM hire_date) = 1999  -- hanya menampilkan karyawan yang direkrut pada tahun 1999
ORDER BY
  hire_date DESC;    -- hasil diurutkan dari tanggal perekrutan terbaru




-- Contoh penggunaan operator logika (AND, OR, BETWEEN) pada klausa WHERE


-- =========================
-- Operator AND
-- =========================

-- Menampilkan karyawan dengan job_id = 9 dan gaji lebih dari 5000
SELECT
  first_name,     -- nama depan
  last_name,      -- nama belakang
  job_id,         -- ID pekerjaan
  salary          -- gaji
FROM
  employees
WHERE
  job_id = 9      -- kondisi pertama
  AND salary > 5000;  -- kondisi kedua, harus terpenuhi juga


-- Menampilkan karyawan yang direkrut antara tahun 1998 dan 1999
SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE
  EXTRACT(year FROM hire_date) >= 1998   -- tahun perekrutan minimal 1998
  AND EXTRACT(year FROM hire_date) <= 1999  -- maksimal 1999
ORDER BY hire_date;   -- urut berdasarkan tanggal perekrutan


-- Menunjukkan bahwa ekspresi AND dievaluasi dari kiri ke kanan
SELECT
  1 = 0             -- hasilnya FALSE
  AND 1 / 0 = 1 AS result;  -- tidak dieksekusi karena kondisi pertama sudah FALSE


-- =========================
-- Operator OR
-- =========================

-- Menampilkan karyawan yang direkrut pada tahun 1999 atau 2000
SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE
  EXTRACT(year FROM hire_date) = 1999
  OR EXTRACT(year FROM hire_date) = 2000
ORDER BY
  hire_date;


-- Menggunakan kombinasi AND dan OR dengan tanda kurung untuk mengontrol prioritas logika
SELECT
  first_name,
  last_name,
  hire_date,
  department_id
FROM
  employees
WHERE
  department_id = 3  -- hanya departemen 3
  AND (EXTRACT(year FROM hire_date) = 1999 OR EXTRACT(year FROM hire_date) = 2000)
ORDER BY
  hire_date;


-- Tanpa tanda kurung, hasil logika bisa berbeda karena AND dievaluasi lebih dulu daripada OR
SELECT
  first_name,
  last_name,
  hire_date,
  department_id
FROM
  employees
WHERE
  department_id = 3
  AND EXTRACT(year FROM hire_date) = 1999
  OR EXTRACT(year FROM hire_date) = 2000
ORDER BY
  hire_date;
-- Catatan: Query ini menampilkan karyawan departemen 3 yang direkrut tahun 1999
-- ATAU siapa pun (departemen berapa pun) yang direkrut tahun 2000.


-- Menggunakan beberapa OR untuk beberapa tahun tertentu
SELECT
  first_name,
  last_name,
  hire_date,
  department_id
FROM
  employees
WHERE
    EXTRACT(year FROM hire_date) = 1990
 OR EXTRACT(year FROM hire_date) = 1999
 OR EXTRACT(year FROM hire_date) = 2000
ORDER BY
  hire_date;


-- Menggunakan IN untuk menyingkat kondisi OR
SELECT
  first_name,
  last_name,
  hire_date,
  department_id
FROM
  employees
WHERE
  EXTRACT(year FROM hire_date) IN (1990, 1999, 2000)  -- sama dengan tiga OR di atas
ORDER BY
  hire_date;


-- =========================
-- Operator BETWEEN
-- =========================

-- Menampilkan karyawan dengan gaji antara 2500 dan 2900
SELECT
  employee_id,
  first_name,
  last_name,
  salary
FROM
  employees
WHERE
  salary BETWEEN 2500 AND 2900   -- rentang nilai
ORDER BY
  salary;


-- Sama dengan penggunaan dua kondisi AND
SELECT
  employee_id,
  first_name,
  last_name,
  salary
FROM
  employees
WHERE
  salary >= 2500
  AND salary <= 2900
ORDER BY
  salary;


-- Menampilkan karyawan dengan gaji di luar rentang 2500–2900
SELECT
  employee_id,
  first_name,
  last_name,
  salary
FROM
  employees
WHERE
  salary NOT BETWEEN 2500 AND 2900
ORDER BY
  salary;


-- Menggunakan BETWEEN untuk tanggal
SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE
  hire_date BETWEEN '1999-01-01' AND '2000-12-31'
ORDER BY
  hire_date;


-- Menampilkan karyawan yang direkrut di luar rentang tanggal tertentu
SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE
  hire_date NOT BETWEEN '1994-01-01' AND '1999-12-31'
ORDER BY
  hire_date;


-- BETWEEN juga dapat digunakan untuk tahun hasil ekstraksi
SELECT
  first_name,
  last_name,
  EXTRACT(YEAR FROM hire_date) AS joined_year
FROM
  employees
WHERE
  EXTRACT(YEAR FROM hire_date) BETWEEN 1999 AND 2000
ORDER BY
  hire_date;



-- ==========================================
-- Operator IN
-- ==========================================

-- Menampilkan karyawan dengan job_id bernilai 8, 9, atau 10
SELECT
  first_name,   -- nama depan
  last_name,    -- nama belakang
  job_id        -- ID pekerjaan
FROM
  employees
WHERE
  job_id IN (8, 9, 10)   -- hanya data dengan job_id 8, 9, atau 10 yang ditampilkan
ORDER BY
  job_id;                 -- diurutkan berdasarkan job_id


-- Menampilkan karyawan yang job_id-nya bukan 7, 8, atau 9
SELECT
  first_name,
  last_name,
  job_id
FROM
  employees
WHERE
  job_id NOT IN (7, 8, 9)  -- mengecualikan job_id 7, 8, dan 9
ORDER BY
  job_id;


-- Menampilkan karyawan dengan nama depan tertentu
SELECT
  first_name,
  last_name
FROM
  employees
WHERE
  first_name IN ('Steven', 'Lex', 'Daniel');  -- hanya nama yang cocok dengan daftar ini


-- Menampilkan karyawan yang direkrut pada tanggal-tanggal tertentu
SELECT
  first_name,
  last_name, 
  hire_date
FROM
  employees
WHERE
  hire_date IN ('1987-06-17', '1994-08-16', '1997-09-30');  -- hanya tanggal ini yang dipilih


-- Menampilkan karyawan yang direkrut pada bulan Januari, Februari, atau Maret
SELECT
  first_name,
  last_name, 
  hire_date,
  EXTRACT(MONTH FROM hire_date) AS joined_month
FROM
  employees
WHERE
  EXTRACT(MONTH FROM hire_date) IN (1, 2, 3)   -- memfilter bulan 1, 2, dan 3
ORDER BY 
  joined_month;  -- urut berdasarkan bulan perekrutan


-- ==========================================
-- Operator LIKE (untuk pencocokan pola teks)
-- ==========================================

-- Mencari nama depan yang diawali dengan 'Da'
SELECT
  first_name,
  last_name
FROM
  employees
WHERE
  first_name LIKE 'Da%'    -- % artinya karakter bebas setelah 'Da'
ORDER BY
  first_name;


-- Mencari nama depan yang diakhiri dengan 'er'
SELECT
  first_name,
  last_name
FROM
  employees
WHERE
  first_name LIKE '%er'    -- % artinya karakter bebas sebelum 'er'
ORDER BY
  first_name;


-- Mencari nama depan yang mengandung 'an' di tengah
SELECT
  first_name,
  last_name
FROM
  employees
WHERE
  first_name LIKE '%an%'   -- % di kedua sisi berarti mengandung 'an'
ORDER BY
  first_name;


-- Mencari nama depan yang dimulai dengan 'Jo' dan memiliki total 4 huruf
SELECT
  first_name,
  last_name
FROM
  employees
WHERE
  first_name LIKE 'Jo__'   -- _ (underscore) mewakili satu karakter
ORDER BY
  first_name;


-- Mencari nama depan yang berakhiran dengan 'are' dan memiliki satu huruf tambahan di akhir
SELECT
  first_name,
  last_name
FROM
  employees
WHERE
  first_name LIKE '%are_'  -- % karakter bebas di depan, _ satu karakter di belakang
ORDER BY
  first_name;


-- Menampilkan nama depan yang dimulai dengan 'S' tetapi tidak dengan 'Sh'
SELECT
  first_name,
  last_name
FROM
  employees
WHERE
  first_name LIKE 'S%'          -- nama depan mulai dengan huruf S
  AND first_name NOT LIKE 'Sh%' -- tapi tidak diawali dengan Sh
ORDER BY
  first_name;


-- ==========================================
-- Operator IS NULL
-- ==========================================

-- Contoh salah: membandingkan NULL dengan tanda "=" tidak akan menghasilkan apa pun
SELECT
  first_name,
  last_name,
  phone_number
FROM
  employees
WHERE
  phone_number = NULL;  -- tidak akan menampilkan hasil karena NULL ≠ nilai apa pun


-- Contoh benar: mencari data yang nilai phone_number-nya kosong (NULL)
SELECT
  first_name,
  last_name,
  phone_number
FROM
  employees
WHERE
  phone_number IS NULL;  -- menampilkan hanya baris dengan nilai NULL


-- Menampilkan data karyawan yang memiliki nomor telepon (tidak NULL)
SELECT
  first_name,
  last_name,
  phone_number
FROM
  employees
WHERE
  phone_number IS NOT NULL;  -- menampilkan data yang memiliki nomor telepon


-- ==========================================
-- Operator NOT
-- ==========================================
-- Operator NOT digunakan untuk membalik (membuat negasi) hasil logika dari kondisi.
-- Artinya, jika kondisi bernilai TRUE maka hasilnya menjadi FALSE, dan sebaliknya.

-- Menampilkan karyawan yang gajinya TIDAK lebih besar atau sama dengan 3000
SELECT
  first_name,   -- nama depan karyawan
  salary        -- gaji karyawan
FROM
  employees
WHERE
  NOT salary >= 3000;  -- artinya sama dengan salary < 3000


-- Menampilkan karyawan yang TIDAK berada di department_id 10 atau 20
SELECT
  first_name,     -- nama depan karyawan
  last_name,      -- nama belakang karyawan
  department_id   -- ID departemen
FROM
  employees
WHERE
  NOT (                     -- membalik kondisi di dalam tanda kurung
    department_id = 10      -- departemen 10
    OR department_id = 20   -- atau departemen 20
  );
-- Artinya: tampilkan karyawan yang department_id-nya BUKAN 10 dan BUKAN 20.




















