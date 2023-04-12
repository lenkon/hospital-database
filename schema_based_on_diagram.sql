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

-- invoices table
CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE INDEX ix_invoice_history_id ON invoices(medical_history_id);

-- invoice_items table
CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT NOT NULL,
  treatment_id INT,
  FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE INDEX ix_item_invoice_id ON invoice_items(invoice_id);
CREATE INDEX ix_item_treatment_id ON invoice_items(treatment_id);
