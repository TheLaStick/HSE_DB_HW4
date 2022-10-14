CREATE SCHEMA IF NOT EXISTS Hospital;

CREATE TABLE IF NOT EXISTS Hospital.StationPersonell
(
    PersNr SERIAL PRIMARY KEY,
    Name   TEXT,
    StatNr INT
);

CREATE TABLE IF NOT EXISTS Hospital.Caregiver
(
    PersNr        SERIAL PRIMARY KEY,
    Qualification TEXT
);

CREATE TABLE IF NOT EXISTS Hospital.Doctor
(
    PersNr SERIAL PRIMARY KEY,
    Area   TEXT,
    Rank   INT
);

CREATE TABLE IF NOT EXISTS Hospital.Patient
(
    PatientNr SERIAL PRIMARY KEY,
    Name      TEXT,
    Disease   TEXT,
    PersNr    INT
);

CREATE TABLE IF NOT EXISTS Hospital.Station
(
    StatNr SERIAL PRIMARY KEY,
    Name   TEXT
);

CREATE TABLE IF NOT EXISTS Hospital.Room
(
    RoomNr SERIAL PRIMARY KEY,
    Beds   INT,
    StatNr INT
);

CREATE TABLE IF NOT EXISTS Hospital.Admission
(
    PatientNr SERIAL,
    RoomNr    SERIAL,
    DateFrom  TIMESTAMP,
    DateTo    TIMESTAMP,
    PRIMARY KEY (PatientNr, RoomNr, DateFrom, DateTo)
);

ALTER TABLE Hospital.StationPersonell
    ADD FOREIGN KEY (StatNr) REFERENCES Hospital.Station (StatNr);

ALTER TABLE Hospital.Doctor
    ADD FOREIGN KEY (PersNr) REFERENCES Hospital.StationPersonell (PersNr);

ALTER TABLE Hospital.Caregiver
    ADD FOREIGN KEY (PersNr) REFERENCES Hospital.StationPersonell (PersNr);

ALTER TABLE Hospital.Patient
    ADD FOREIGN KEY (PersNr) REFERENCES Hospital.Doctor (PersNr);

ALTER TABLE Hospital.Room
    ADD FOREIGN KEY (StatNr) REFERENCES Hospital.Station (StatNr);

ALTER TABLE Hospital.Admission
    ADD FOREIGN KEY (PatientNr) REFERENCES Hospital.Patient (PatientNr);
ALTER TABLE Hospital.Admission
    ADD FOREIGN KEY (RoomNr) REFERENCES Hospital.Room (RoomNr);
