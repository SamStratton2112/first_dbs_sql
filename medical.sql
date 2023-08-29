
DROP DATABASE IF EXISTS medical_db;

CREATE DATABASE medical_db;

\c medical_db

CREATE TABLE doctors
(
    doctor_id SERIAL PRIMARY KEY UNIQUE,
    full_name TEXT NOT NULL
);

CREATE TABLE patients
(
    patient_id SERIAL PRIMARY KEY UNIQUE,
    full_name TEXT NOT NULL
);

CREATE TABLE appointments
(
    appointment_id SERIAL PRIMARY KEY UNIQUE,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
    appointment_date DATE,
    diagnosis TEXT DEFAULT 'Hypochondriac'
);


INSERT INTO doctors (full_name)
VALUES ('Martin Doychev');

INSERT INTO patients (full_name)
VALUES ('Milo Stratton');

INSERT INTO appointments (doctor_id, patient_id, appointment_date, diagnosis)
VALUES ('1','1', '01/01/2024', 'Broken left arm');
