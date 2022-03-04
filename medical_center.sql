-- Part One: Medical Center

CREATE TABLE "Doctors" (
    "DoctorID" int   NOT NULL,
    "FirstName" Text   NOT NULL,
    "LastName" Text   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "DoctorID"
     )
);

CREATE TABLE "Patients" (
    "PatientID" int   NOT NULL,
    "FirstName" Text   NOT NULL,
    "LastName" Text   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "Doctors_Patients" (
    "DoctorID" int   NOT NULL,
    "PatientID" int   NOT NULL
);

CREATE TABLE "Diseases" (
    "DiseaseID" int   NOT NULL,
    "Name" Text   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "DiseaseID"
     ),
    CONSTRAINT "uc_Diseases_Name" UNIQUE (
        "Name"
    )
);

CREATE TABLE "Diagnosis" (
    "PatientID" int   NOT NULL,
    "DiseaseID" int   NOT NULL
);

ALTER TABLE "Doctors_Patients" ADD CONSTRAINT "fk_Doctors_Patients_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctors" ("DoctorID");

ALTER TABLE "Doctors_Patients" ADD CONSTRAINT "fk_Doctors_Patients_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Diseases" ("DiseaseID");

