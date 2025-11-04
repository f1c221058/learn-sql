-- Perintah INSERT
-- Menambahkan data ke tabel 'dependents' untuk seorang anak dengan employee_id 178
INSERT INTO dependents (first_name, last_name, relationship, employee_id)
VALUES ('Dustin', 'Johnson', 'Child', 178);

-- Menampilkan semua data dependents yang memiliki employee_id 178
SELECT * FROM dependents WHERE employee_id = 178;

-- Menambahkan dua data dependents untuk employee_id 192 (dua anak dengan nama Cameron dan Michelle Bell)
INSERT INTO dependents (first_name, last_name, relationship, employee_id)
VALUES ('Cameron', 'Bell', 'Child', 192),
       ('Michelle', 'Bell', 'Child', 192);

-- Menampilkan semua data dependents yang memiliki employee_id 192
SELECT * FROM dependents WHERE employee_id = 192;

-- Perintah UPDATE
-- Menambahkan data dependents untuk employee_id 192 (sebelumnya sudah ditambahkan di perintah INSERT di atas)
INSERT INTO dependents (first_name, last_name, relationship, employee_id)
VALUES ('Cameron', 'Bell', 'Child', 192),
       ('Michelle', 'Bell', 'Child', 192);

-- Mengubah last_name karyawan dengan employee_id 192 menjadi 'Lopez'
UPDATE employees
SET last_name = 'Lopez'
WHERE employee_id = 192;

-- Menampilkan data employee dengan employee_id 192 setelah update last_name
SELECT employee_id, first_name, last_name FROM employees WHERE employee_id = 192;

-- Menampilkan semua data dependents untuk employee_id 192
SELECT * FROM dependents WHERE employee_id = 192;

-- Mengubah last_name semua dependents dengan employee_id 192 menjadi 'Lopez'
UPDATE dependents
SET last_name = 'Lopez'
WHERE employee_id = 192;

-- Mengubah last_name dependents berdasarkan last_name karyawan yang bersangkutan
UPDATE dependents
SET last_name = (
    SELECT last_name
    FROM employees
    WHERE employee_id = dependents.employee_id
);

-- Perintah DELETE
-- Menghapus data dependents dengan dependent_id 16
DELETE FROM dependents WHERE dependent_id = 16;

