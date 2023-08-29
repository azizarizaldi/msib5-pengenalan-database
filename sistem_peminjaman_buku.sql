/*! SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*! SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*! SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*! SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/* Query DDL Untuk membuat tabel buku */
DROP TABLE IF EXISTS books;
CREATE TABLE books (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- End Query
 
/* Query DML untuk menambahkan data di tabel buku */
INSERT INTO books (title, author) VALUES
    ('Laskar Pelangi', 'Andrea Hirata'),
    ('Bumi Manusia', 'Pramoedya Ananta Toer'),
    ('Pulang', 'Tere Liye'),
    ('Ayat-Ayat Cinta', 'Habiburrahman El Shirazy'),
    ('Cinta di Dalam Gelas', 'Andrea Hirata');

-- End Queryy

/* Query DDL Untuk membuat tabel users */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- End Query

/* Query DML untuk menambahkan data di tabel users */
INSERT INTO users (fullname, email) VALUES
    ('Aziz Arif Rizaldi', 'azizarif@msib5.com'),
    ('Beni Noor Mahendra', 'beninoor@msib5.com'),
    ('Cecep Rokani', 'ceceprokani@msib5.com'),
    ('Deni Sumarjaya', 'denisumar@msib5.com'),
    ('Eka Gustiwana', 'ekagusti@msib5.com');

-- End Query

/* Query DDL Untuk membuat tabel loans */
DROP TABLE IF EXISTS loans;
CREATE TABLE loans (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    returned BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (book_id) REFERENCES Books(id)
);
-- End Query


/* Query DML untuk menambahkan data di tabel loans */

-- Peminjaman oleh Aziz Arif
INSERT INTO Loans (user_id, book_id, loan_date, due_date) VALUES
    (1, 1, '2023-08-01', '2023-08-15'),
    (1, 3, '2023-08-10', '2023-08-24');

-- Peminjaman oleh Beni
INSERT INTO Loans (user_id, book_id, loan_date, due_date) VALUES
    (2, 2, '2023-08-05', '2023-08-19'),
    (2, 4, '2023-08-12', '2023-08-26');

-- Peminjaman oleh Cecep
INSERT INTO Loans (user_id, book_id, loan_date, due_date) VALUES
    (3, 5, '2023-08-08', '2023-08-22');

-- Peminjaman oleh Deni
INSERT INTO Loans (user_id, book_id, loan_date, due_date) VALUES
    (4, 1, '2023-08-15', '2023-08-29');

-- Peminjaman oleh Eka
INSERT INTO Loans (user_id, book_id, loan_date, due_date) VALUES
    (5, 3, '2023-08-20', '2023-09-03');

-- End Query

/*! SET SQL_MODE=@OLD_SQL_MODE */;
/*! SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*! SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*! SET SQL_NOTES=@OLD_SQL_NOTES */;