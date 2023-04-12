/* Database schema to keep the structure of entire database. */

-- Create database hospital
CREATE DATABASE hospital;

-- patients table
CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  date_of_birth DATE NOT NULL
);

--  medical_histories table 
CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT NOT NULL,
  status VARCHAR(120),
  FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE INDEX ix_history_patient_id ON medical_histories(patient_id);

-- treatments table
CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(80),
  name VARCHAR(120)
);
