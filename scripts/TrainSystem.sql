CREATE SCHEMA IF NOT EXISTS TrainSystem;

CREATE TABLE IF NOT EXISTS TrainSystem.City (
  CityName TEXT,
  Region INT,
  PRIMARY KEY (CityName, Region)
);

CREATE TABLE IF NOT EXISTS TrainSystem.Station (
  StationName TEXT PRIMARY KEY,
  Tracks INT UNIQUE,
  CityName TEXT,
  Region INT
);

CREATE TABLE IF NOT EXISTS TrainSystem.Train (
  TrainNr SERIAL PRIMARY KEY,
  Length INT,
  StationToName TEXT,
  StationFromName TEXT
);

CREATE TABLE IF NOT EXISTS TrainSystem.Connected (
  StationToName TEXT,
  StationFromName TEXT,
  TrainNr SERIAL,
  departure TIMESTAMP,
  arrival TIMESTAMP,
  PRIMARY KEY (StationToName, StationFromName, TrainNr)
);


ALTER TABLE TrainSystem.Station ADD FOREIGN KEY (CityName, Region) REFERENCES TrainSystem.City (CityName, Region);

ALTER TABLE TrainSystem.Train ADD FOREIGN KEY (StationToName) REFERENCES TrainSystem.Station (StationName);
ALTER TABLE TrainSystem.Train ADD FOREIGN KEY (StationFromName) REFERENCES TrainSystem.Station (StationName);

ALTER TABLE TrainSystem.Connected ADD FOREIGN KEY (StationToName) REFERENCES TrainSystem.Station (StationName);
ALTER TABLE TrainSystem.Connected ADD FOREIGN KEY (StationFromName) REFERENCES TrainSystem.Station (StationName);
ALTER TABLE TrainSystem.Connected ADD FOREIGN KEY (TrainNr) REFERENCES TrainSystem.Train (TrainNr);
