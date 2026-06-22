
 Create Database public_health_clinic_records_system;

TABLE CREATION
Create Table patient (
    Patient_ID INT Primary Key AUTO_INCREMENT,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Date_Of_Birth DATE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone_Number VARCHAR(50),
    Address VARCHAR(200)
    );

Create Table health_worker (
    Health_Worker_ID INT Primary Key AUTO_INCREMENT,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Date_Of_Birth DATE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone_Number VARCHAR(50),
    Role  VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL
    );

Create Table appointment (
    Appointment_ID INT Primary Key AUTO_INCREMENT,
    Patient_ID INT NOT NULL,
    Health_Worker_ID INT NOT NULL,
    Visit_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
     Reason_For_Visit VARCHAR(255) NOT NULL,
    Room_Number VARCHAR(10),
   Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Foreign Key (Patient_ID) References patient(Patient_ID)
    On Delete Cascade On Update Cascade,
    Foreign Key (Health_Worker_ID) References health_worker(Health_Worker_ID)
    On Delete Cascade On Update Cascade
    );

Create Table diagnosis (
    Diagnosis_ID  INT Primary Key AUTO_INCREMENT,
    Appointment_ID  INT NOT NULL,
    Diagnosis_Type  VARCHAR(100)  NOT NULL,
    Condition_Name  VARCHAR(200)  NOT NULL,
    Diagnosis_Date  DATE  NOT NULL,
    Severity VARCHAR(50),
    Notes TEXT,
    Foreign Key (Appointment_ID) References appointment(Appointment_ID)
    On Delete Cascade On Update Cascade
    );    

Create Table treatment (
    Treatment_ID INT Primary Key AUTO_INCREMENT,
    Diagnosis_ID INT NOT NULL,
    Foreign Key (Diagnosis_ID) References diagnosis(Diagnosis_ID)
    On Delete Cascade On Update Cascade,
    Medication VARCHAR(255)  NOT NULL,
    Dosage VARCHAR(100)  NOT NULL,
    Frequency VARCHAR(100)  NOT NULL,
    Duration VARCHAR(100),
    Start_Date DATE NOT NULL,
    End_Date DATE,
    Status VARCHAR(50) NOT NULL Default 'Ongoing'
    );

INSERTING RECORDS TO EACH TABLE
Insert Into patient (First_Name, Last_Name, Gender, Date_Of_Birth, Email, Phone_Number, Address)
Values
('Amadu',    'Bah',        'Male',  '1995-04-10', 'amadubah@gmail.com',         076100001, '12 Circular Road, Freetown'),
('Lennard',  'Kanu',       'Male',  '1993-07-22', 'lennardkanu@gmail.com',      077100002, '5 Sanders Street, Freetown'),
('Berick',   'Ajuno-Sesay','Male',  '1988-11-15', 'berickajunosesay@gmail.com', 078100003, '8 Pademba Road, Freetown'),
('Marian',   'Nyandebo',   'Female','2001-03-08', 'mariannyandebo@gmail.com',   075100004, '20 Wilkinson Road, Freetown'),
('Zainab',   'Jalloh',     'Female','1997-06-30', 'zainabjalloh@gmail.com',     079100005, '3 Congo Cross, Freetown'),
('Gleekan',  'Davies',     'Male',  '1990-09-14', 'gleekandavies@gmail.com',    034100006, '7 Hill Station, Freetown'),
('Elizabeth','Dimoh',      'Female','1985-12-25', 'elizabethdimoh@gmail.com',   031100007, '15 Murray Town, Freetown'),
('Kerry',     'Davies',    'Male',  '1999-02-18', 'kerrydavies@gmail.com',      032100008, '11 Lumley Beach Road, Freetown'),
('Hasatu',    'Bah',      'Female', '2000-08-05', 'hasatubah@gmail.com',       099100009, '6 King Harman Road, Freetown'),
('Aminata',   'Koroma',   'Female', '1992-01-12', 'aminatakoroma@gmail.com',   076100010, '18 Fourah Bay Road, Freetown'), 
('Mohamed',   'Kamara',   'Male',   '1987-05-20', 'mohamedkamara@gmail.com',   078100011, '9 Brookfields, Freetown'), 
('Fatmata',   'Sesay',    'Female', '1994-10-03', 'fatmatasesay@gmail.com',    079100012, '22 Spur Road, Freetown'),
('Ibrahim',   'Bangura',  'Male',   '1980-07-17','ibrahimbangura@gmail.com',   076100013, '4 Charlotte Street, Freetown'),
('Mariama',   'Conteh',   'Female','1996-03-28', 'mariamaconteh@gmail.com',    077100014, '30 Wellington Street, Freetown'),
('Alimamy',   'Turay',    'Male',  '1983-11-09', 'alimamyturay@gmail.com',     030100015, '13 Kissy Road, Freetown'),
('Hawa',      'Fofanah',  'Female','2003-06-21', 'hawafofanah@gmail.com',      072100016, '2 Regent Road, Freetown'),
('Sorie',     'Mansaray', 'Male',  '1975-09-11', 'soriemansaray@gmail.com',    074100017, '27 Dundas Street, Freetown'),
('Isata',     'Dumbuya', 'Female', '1991-04-16', 'isatadumbuya@gmail.com',     079100018, '10 Sanders Street, Freetown'),
('Lansana',   'Koroma',  'Male',   '1986-08-02', 'lansanakoroma@gmail.com',    077100019, '16 Lightfoot Boston Street, Freetown'),
('Adama',     'Kamara', 'Female', '1998-12-14', 'adamakamara@gmail.com',      078100020, '35 Brookfields Road, Freetown');


Insert Into health_worker (First_Name, Last_Name, Gender, Date_Of_Birth, Email, Phone_Number, Role, Department)
Values
('Sheik Umar',   'Kanu',    'Male', '1978-03-15', 'sheikumarkanu@clinic.sl',       077200001, 'Doctor',      'General Medicine'),
('Elijah',       'Fullah',  'Male',  '1985-07-22', 'elijahfullah@clinic.sl',       077200002, 'Doctor',       'Surgery'),
('Osman',        'Bah',     'Male',   '1990-11-08', 'osmanbah@clinic.sl',          077200003, 'Nurse',        'General Medicine'),
('Hawa',         'Kallon',  'Female', '1988-05-30', 'hawakallon@clinic.sl',        077200004, 'Nurse',        'Paediatrics'),
('Sulaiman ',    'Dainkeh', 'Male',   '1982-09-14', 'sulaimandainkeh@clinic.sl',   077200005, 'Doctor',       'Paediatrics'),
('Santigie Foday','Kamara', 'Male',   '1975-12-01', 'santigiefodaykamara@clinic.sl',077200006, 'Doctor',       'Obstetrics'),
('Alusine',      'Lavalie', 'Male',   '1993-04-18', 'alusinelavalie@clinic.sl',     077200007, 'Nurse',        'Surgery'),
('Joseph Saidu', 'Serry',   'Male',   '1980-08-25', 'josephsaiduserry@clinic.sl',   077200008, 'Doctor',       'Cardiology'),
    ('Ibrahim',      'Koroma',  'Male',   '1987-02-11', 'ibrahimkoroma@clinic.sl',  077200009, 'Pharmacist',   'Pharmacy'),
    ('Abubakarr',    'Koroma',  'Male',   '1979-06-07', 'abubakarrkoroma@clinic.sl',077200010, 'Lab Technician','Laboratory'),
    ('Abass',        'Sesay',   'Male',   '1983-10-19', 'abasssesay@clinic.sl',     077200011, 'Doctor',       'General Medicine'),
    ('Kadija',       'Bangura', 'Female', '1991-03-27', 'kadijabangura@clinic.sl',  077200012, 'Nurse',        'Obstetrics'),
    ('Foday',        'Conteh',  'Male',   '1977-07-14', 'fodayconteh@clinic.sl',    077200013, 'Doctor',       'Surgery'),
    ('Memuna',       'Turay',   'Female', '1994-01-09', 'memunaturay@clinic.sl',    077200014, 'Nurse',        'Paediatrics'),
    ('Amara',        'Dumbuya', 'Male',   '1986-05-23', 'amaradumbuya@clinic.sl',   077200015, 'Doctor',       'Cardiology'),
    ('Mariatu',      'Koroma',  'Female', '1989-09-16', 'mariatukoroma@clinic.sl',  077200016, 'Nurse',        'General Medicine'),
    ('Brima',        'Mansaray','Male',   '1981-12-04', 'brimamansaray@clinic.sl',  077200017, 'Lab Technician','Laboratory'),
    ('Fanta',        'Kamara',  'Female', '1995-04-30', 'fantakamara@clinic.sl',    077200018, 'Pharmacist',   'Pharmacy'),
    ('Sorie',        'Jalloh',  'Male',   '1984-08-12', 'soriejalloh@clinic.sl',    077200019, 'Doctor',       'General Medicine'),
    ('Isatu',        'Fofanah', 'Female', '1992-11-21', 'isatufofanah@clinic.sl',   077200020, 'Nurse',        'Surgery');
INSERT INTO appointment (Patient_ID, Health_Worker_ID, Visit_Date, Reason_For_Visit, Room_Number)
VALUES
(1,  1,  '2026-01-05', 'Persistent headache and fever',          'Ward 1'),
(2,  2,  '2026-01-06', 'Abdominal pain consultation',            'Ward 2'),
(3,  5,  '2026-01-07', 'Malaria symptoms',                       'Ward 3'),
(4,  6,  '2026-01-08', 'Routine antenatal check-up',             'Ward 2'),
(5,  1,  '2026-01-09', 'High blood pressure monitoring',         'Ward 1'),
(6,  5,  '2026-01-10', 'Respiratory infection in child',         'Ward 4'),
(7,  2,  '2026-01-12', 'Wound dressing post-surgery',            'Ward 5'),
(8,  8,  '2026-01-13', 'Chest pain and palpitations',            'Ward 6'),
(9,  5,  '2026-01-14', 'Typhoid fever symptoms',                 'Ward 2'),
(10, 1,  '2026-01-15', 'Diabetes management consultation',       'Ward 1'),
(11, 3,  '2026-01-16', 'General body weakness and fatigue',      'Ward 2'),
(12, 6,  '2026-01-17', 'Antenatal second trimester review',      'Ward 7'),
(13, 9,  '2026-01-18', 'Medication refill request',              'Ward 6'),
(14, 10, '2026-01-19', 'Blood test and lab investigation',       'Ward 7'),
(15, 1,  '2026-01-20', 'Malaria follow-up review',               'Ward 1'),
(16, 4,  '2026-01-21', 'Post-natal care check-up',               'Ward 5'),
(17, 2,  '2026-01-22', 'Hernia pre-surgical consultation',       'Ward 3'),
(18, 8,  '2026-01-23', 'Hypertension monitoring',                'Ward 5'),
(19, 5,  '2026-01-24', 'Child vaccination follow-up',            'Ward 2'),
(20, 11, '2026-01-25', 'Skin rash and allergic reaction',        'Ward 1');

Insert Into diagnosis (Appointment_ID, Diagnosis_Type, Condition_Name, Diagnosis_Date, Severity, Notes)
Values
    (1,  'Infectious',       'Malaria',                    '2026-01-05', 'Moderate', 'Patient tested positive via RDT. Plasmodium falciparum confirmed.'),
    (2,  'Gastrointestinal', 'Acute Appendicitis',         '2026-01-06', 'Severe',   'Urgent surgical referral recommended immediately.'),
    (3,  'Infectious',       'Malaria',                    '2026-01-07', 'Severe',   'High parasite density. Admitted for inpatient care.'),
    (4,  'Obstetric',        'Normal Antenatal Progress',  '2026-01-08', 'None',     'Blood pressure and foetal heartbeat normal at 24 weeks.'),
    (5,  'Cardiovascular',   'Hypertension Stage 2',       '2026-01-09', 'High',     'BP reading 165/100. Medication dosage adjusted.'),
    (6,  'Respiratory',      'Acute Bronchitis',           '2026-01-10', 'Mild',     'Child prescribed antibiotics and steam inhalation therapy.'),
    (7,  'Surgical',         'Post-Operative Wound Care',  '2026-01-12', 'Moderate', 'Wound healing satisfactorily. Dressing changed successfully.'),
    (8,  'Cardiovascular',   'Cardiac Arrhythmia',         '2026-01-13', 'High',     'Irregular heartbeat detected. ECG ordered. Referred to cardiologist.'),
    (9,  'Infectious',       'Typhoid Fever',              '2026-01-14', 'Moderate', 'Widal test positive. Oral rehydration and antibiotics started.'),
    (10, 'Endocrine',        'Type 2 Diabetes',            '2026-01-15', 'Moderate', 'HbA1c elevated at 8.2%. Lifestyle counselling and medication given.'),
    (11, 'General',          'Anaemia',                    '2026-01-16', 'Mild',     'Haemoglobin level low at 9g/dL. Iron supplementation started.'),
    (12, 'Obstetric',        'Gestational Hypertension',   '2026-01-17', 'High',     'BP elevated at 150/95. Close monitoring and bed rest advised.'),
    (13, 'Endocrine',        'Type 2 Diabetes',            '2026-01-18', 'Moderate', 'Medication refill issued. Blood sugar stable at current dosage.'),
    (14, 'Infectious',       'Malaria',                    '2026-01-19', 'Mild',     'RDT positive. Early-stage malaria. Outpatient treatment prescribed.'),
    (15, 'Infectious',       'Malaria Recovery Phase',     '2026-01-20', 'Low',      'Parasite count reduced significantly. Continue medication to completion.'),
    (16, 'Obstetric',        'Normal Post-Natal Progress', '2026-01-21', 'None',     'Mother and newborn both healthy. Breastfeeding advice given.'),
    (17, 'Surgical',         'Inguinal Hernia',            '2026-01-22', 'Moderate', 'Surgical repair scheduled for next available theatre slot.'),
    (18, 'Cardiovascular',   'Hypertension Controlled',    '2026-01-23', 'Moderate', 'BP improved to 138/88. Maintain current antihypertensive medication.'),
    (19, 'Preventive',       'Routine Immunisation',       '2026-01-24', 'None',     'Child received measles and rubella vaccines as per national schedule.'),
    (20, 'Dermatological',   'Allergic Dermatitis',        '2026-01-25', 'Mild',     'Skin rash consistent with allergic reaction. Antihistamine prescribed.');

Insert Into treatment (Diagnosis_ID, Medication, Dosage, Frequency, Duration, Start_Date, End_Date, Status)
Values
    (1,  'Artemether-Lumefantrine', '80mg/480mg',  'Twice daily',       '3 days',  '2026-01-05', '2026-01-08', 'Completed'),
    (2,  'Metronidazole',           '500mg',        'Three times daily', '7 days',  '2026-01-06', '2026-01-13', 'Completed'),
    (3,  'Artesunate IV',           '2.4mg/kg',     'Every 12 hours',   '5 days',  '2026-01-07', '2026-01-12', 'Completed'),
    (4,  'Folic Acid + Iron',       '400mcg/60mg',  'Once daily',       '30 days', '2026-01-08', '2026-02-08', 'Completed'),
    (5,  'Amlodipine',              '10mg',         'Once daily',       'Ongoing', '2026-01-09', NULL,         'Ongoing'),
    (6,  'Amoxicillin',             '250mg',        'Three times daily', '7 days', '2026-01-10', '2026-01-17', 'Completed'),
    (7,  'Povidone-Iodine Dressing','Topical',      'Daily',            '14 days', '2026-01-12', '2026-01-26', 'Completed'),
    (8,  'Bisoprolol',              '5mg',          'Once daily',       'Ongoing', '2026-01-13', NULL,         'Ongoing'),
    (9,  'Ciprofloxacin',           '500mg',        'Twice daily',      '14 days', '2026-01-14', '2026-01-28', 'Completed'),
    (10, 'Metformin',               '500mg',        'Twice daily',      'Ongoing', '2026-01-15', NULL,         'Ongoing'),
    (11, 'Ferrous Sulphate',        '200mg',        'Twice daily',      '30 days', '2026-01-16', '2026-02-16', 'Completed'),
    (12, 'Methyldopa',              '250mg',        'Three times daily', 'Ongoing','2026-01-17', NULL,         'Ongoing'),
    (13, 'Metformin',               '850mg',        'Twice daily',      'Ongoing', '2026-01-18', NULL,         'Ongoing'),
    (14, 'Artemether-Lumefantrine', '80mg/480mg',   'Twice daily',      '3 days',  '2026-01-19', '2026-01-22', 'Completed'),
    (15, 'Artemether-Lumefantrine', '80mg/480mg',   'Twice daily',      '3 days',  '2026-01-20', '2026-01-23', 'Completed'),
    (16, 'Vitamin D + Calcium',     '400IU/500mg',  'Once daily',       '30 days', '2026-01-21', '2026-02-21', 'Completed'),
    (17, 'Paracetamol',             '500mg',         'Twice daily',      '5 days',  '2026-01-22', '2026-01-27', 'Completed'),
    (18, 'Amlodipine',              '10mg',         'Once daily',       'Ongoing', '2026-01-23', NULL,         'Ongoing'),
    (19, 'Measles-Rubella Vaccine', 'Standard dose','Single dose',      '1 day',   '2026-01-24', '2026-01-24', 'Completed'),
    (20, 'Cetirizine',              '10mg',         'Once daily',       '7 days',  '2026-01-25', '2026-02-01', 'Completed');

UPDATE STATEMENTS 
Update patient
Set Phone_Number = 076000099
Where Patient_ID = 1;

Update appointment
Set Room_Number = 'Ward 4'
Where Appointment_ID = 3
Update treatment
Set Status = 'Completed', End_Date = '2026-05-01'
Where Treatment_ID = 5;

Update diagnosis
Set Severity = 'High', Notes = 'Patient condition worsened. Referred to specialist.'
Where Diagnosis_ID = 5;

DELETE STATEMENT
Since our patient table already contained exactly 20 records that we wanted to preserve, we inserted a temporary dummy record solely to serve as a target for the DELETE demonstration. Once the DELETE statement was executed successfully, the temporary record was removed and the table returned to its original 20 records.
Insert Into patient (First_Name, Last_Name, Gender, Date_Of_Birth, Email, Phone_Number, Address)
Values ('Coolest', 'Bah', 'Male', '2000-01-01', 'coolestbah@clinic.sl', 070000000, '2B Alpha Terrace, Freetown');
Delete From patient
Where Email = 'coolestbah@clinic.sl';
Select all Records
SELECT * FROM patient;
Select Specific Records 
SELECT First_Name, Last_Name, Role, Department FROM health_worker;
Filtering using WHERE
SELECT * FROM appointment WHERE Appointment_ID = 7;
SELECT * FROM patient WHERE Gender != 'Male';
SELECT * FROM health_worker WHERE Role = 'Nurse' AND Department = 'Paediatrics';
SELECT * FROM diagnosis WHERE Severity = 'High' OR Severity = 'Severe';

Range Queries with BETWEEN
Appointments booked within the first two weeks of January 2026
SELECT * FROM appointment
WHERE Visit_Date BETWEEN '2026-01-05' AND '2026-01-15';

Patients born between 1985 and 2000
SELECT * FROM patient
WHERE Date_Of_Birth BETWEEN '1985-01-01' AND '2000-12-31';

Pattern Matchiing with LIKE
Patients whose last name starts with 'K'
SELECT * FROM patient WHERE Last_Name LIKE 'K%';

Diagnosis conditions that contain the word 'Malaria'
SELECT * FROM diagnosis WHERE Condition_Name LIKE '%Malaria%';

Health workers whose email ends with '@clinic.sl'
SELECT * FROM health_worker WHERE Email LIKE '%@clinic.sl';

Selecting from a List with IN
Select specific patients by ID
SELECT * FROM patient WHERE Patient_ID IN (1, 5, 10, 15, 20);

Select diagnoses of a specific type
SELECT * FROM diagnosis WHERE Diagnosis_Type IN ('Infectious', 'Cardiovascular', 'Obstetric');

Select treatments for specific diagnoses
SELECT * FROM treatment WHERE Diagnosis_ID IN (1, 3, 9, 14, 15);


Sorting with ORDER BY
 List all patients alphabetically by last name (A to Z)
SELECT * FROM patient ORDER BY Last_Name ASC;

List all patients by date of birth, oldest first
SELECT * FROM patient ORDER BY Date_Of_Birth ASC;

 List appointments by date, most recent first
SELECT * FROM appointment ORDER BY Visit_Date DESC;

Restricting results with LIMIT
 Show the first 5 patient records
SELECT * FROM patient LIMIT 5;
Show the 3 most recent diagnoses
SELECT * FROM diagnosis ORDER BY Diagnosis_Date DESC LIMIT 3;

Skip first 5 patients, show next 5 (pagination)
SELECT * FROM patient LIMIT 5 OFFSET 5;

Aggregate function 

 COUNT: Total number of patients
SELECT COUNT(*) AS Total_Patients FROM patient;

COUNT: Total number of appointments
SELECT COUNT(Appointment_ID) AS Total_Appointments FROM appointment;

AVG: Average patient age
SELECT AVG(TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE())) AS Average_Patient_Age
FROM patient;
AVG: Average health worker age
SELECT AVG(TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE())) AS Average_Worker_Age
FROM health_worker;


SUM: Total ongoing treatments
SELECT SUM(Status = 'Ongoing') AS Ongoing_Treatments FROM treatment;

 SUM: Total completed treatments
SELECT SUM(Status = 'Completed') AS Completed_Treatments FROM treatment;
 MIN: Oldest patient
SELECT MIN(Date_Of_Birth) AS Oldest_Patient FROM patient;

MIN: Earliest treatment start date
SELECT MIN(Start_Date) AS Earliest_Treatment FROM treatment;

 MAX: Latest appointment date
SELECT MAX(Visit_Date) AS Last_Appointment FROM appointment;

MAX: Youngest patient
SELECT MAX(Date_Of_Birth) AS Youngest_Patient FROM patient;













