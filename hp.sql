USE hospital_db;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS admin;
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);
INSERT INTO admin (username, password)
VALUES ('Tamanna', '1234');
CREATE TABLE doctor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);
INSERT INTO doctor (name, username, password) VALUES
('Dr. Rajesh Sharma', 'rajesh', '1234'),
('Dr. Priya Mehta', 'priya', '1234'),
('Dr. Amit Verma', 'amit', '1234');
CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    disease VARCHAR(100) NOT NULL,
    contact VARCHAR(15),
    room_no VARCHAR(10),
    admitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctor(id)
);