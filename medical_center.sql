-- Part One: Medical Center

DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    FirstName Text NOT NULL,
    LastName Text NOT NULL
);

CREATE TABLE doctors_patients (
    DoctorID INTEGER NOT NULL REFERENCES doctors,
    PatientID INTEGER NOT NULL REFERENCES patients
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    Name Text NOT NULL UNIQUE
);

CREATE TABLE diagnosis (
    PatientID INTEGER NOT NULL REFERENCES patients,
    DiseaseID INTEGER NOT NULL REFERENCES diseases
);

