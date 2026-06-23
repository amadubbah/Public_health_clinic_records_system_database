# 🏥 Public Health Clinic Records System
### COMP 102 – Introduction to Database | Group Final Project
**Limkokwing University of Creative Technology – Sierra Leone Campus**
**Faculty of Information and Communication Technology**
**Semester: March 2026 – July 2026**

---

## 📋 Project Overview

This project is the design and implementation of a **Public Health Clinic Records System** using **MySQL** via **XAMPP**. It was developed as a group final project for the COMP 102 – Introduction to Database module.

The system digitises the core operations of a public health clinic in **Freetown, Sierra Leone**, replacing paper-based filing systems with a structured relational database. It manages patient registrations, health worker profiles, clinic appointments, medical diagnoses, and treatment plans in a secure and organised digital environment.

This project is aligned with the **United Nations Sustainable Development Goal 3 (SDG 3): Good Health and Well-being**, which calls for ensuring healthy lives and promoting well-being for all people at all ages.

---

## 👥 Group Information

| Detail | Info |
|---|---|
| **Module** | COMP 102 – Introduction to Database |
| **Examiner** | Sheik Umar Kanu |
| **Project Type** | Group Final Project (35% of module) |
| **Submission** | Week 11 |
| **Campus** | Limkokwing University – Sierra Leone |

---

## 🎯 Project Objectives

By completing this project, our group was able to:

1. Collaboratively refine and improve the Physical Data Model from Assignment 1
2. Create a fully functional relational database in MySQL using XAMPP
3. Define appropriate data types, primary keys, foreign keys, NOT NULL constraints and default values
4. Populate the database with meaningful and realistic sample data from Sierra Leone clinic scenarios
5. Demonstrate data manipulation using INSERT, UPDATE and DELETE statements
6. Write and execute SQL queries using SELECT, WHERE, ORDER BY, aggregate functions and LIMIT
7. Implement basic MySQL user management including user creation, privilege assignment and password management
8. Present and justify all design and implementation decisions clearly and professionally

---

## 🗄️ Database Structure

**Database Name:** `public_health_clinic_db`

The database contains **5 tables** with **20 records** inserted into each table.

### Tables at a Glance

| Table | Primary Key | Description |
|---|---|---|
| `PATIENT` | patient_id | Stores all patient personal and contact details |
| `HEALTH_WORKER` | health_worker_id | Stores staff profiles including role and department |
| `APPOINTMENT` | appointment_id | Links patients to health workers for clinic visits |
| `DIAGNOSIS` | diagnosis_id | Records the medical diagnosis made at each appointment |
| `TREATMENT` | treatment_id | Records the treatment prescribed for each diagnosis |

---

### Table Definitions

#### PATIENT
```sql
CREATE TABLE PATIENT (
  patient_id     INT AUTO_INCREMENT PRIMARY KEY,
  first_name     VARCHAR(50) NOT NULL,
  last_name      VARCHAR(50) NOT NULL,
  date_of_birth  DATE NOT NULL,
  gender         VARCHAR(10) NOT NULL,
  phone          VARCHAR(100),
  email          VARCHAR(100) UNIQUE,
  address        VARCHAR(200),
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### HEALTH_WORKER
```sql
CREATE TABLE HEALTH_WORKER (
  health_worker_id  INT AUTO_INCREMENT PRIMARY KEY,
  first_name        VARCHAR(50) NOT NULL,
  last_name         VARCHAR(50) NOT NULL,
  role              VARCHAR(50) NOT NULL,
  department        VARCHAR(100) NOT NULL,
  phone             VARCHAR(100),
  email             VARCHAR(100) UNIQUE
);
```

#### APPOINTMENT
```sql
CREATE TABLE APPOINTMENT (
  appointment_id    INT AUTO_INCREMENT PRIMARY KEY,
  patient_id        INT NOT NULL,
  health_worker_id  INT NOT NULL,
  visit_date        DATETIME DEFAULT CURRENT_TIMESTAMP,
  reason            VARCHAR(255),
  created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (health_worker_id) REFERENCES HEALTH_WORKER(health_worker_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
```

#### DIAGNOSIS
```sql
CREATE TABLE DIAGNOSIS (
  diagnosis_id    INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id  INT NOT NULL,
  condition_name  VARCHAR(100) NOT NULL,
  notes           TEXT,
  FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
```

#### TREATMENT
```sql
CREATE TABLE TREATMENT (
  treatment_id  INT AUTO_INCREMENT PRIMARY KEY,
  diagnosis_id  INT NOT NULL,
  medication    VARCHAR(255) NOT NULL,
  dosage        VARCHAR(100),
  status        VARCHAR(50) DEFAULT 'Ongoing',
  FOREIGN KEY (diagnosis_id) REFERENCES DIAGNOSIS(diagnosis_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
```

---

## 🔗 Table Relationships

```
PATIENT ──────────────── APPOINTMENT ──────────────── DIAGNOSIS ──────────────── TREATMENT
(1)          (Many)      (1)         (Many)            (1)        (Many)
             
HEALTH_WORKER ────────── APPOINTMENT
(1)            (Many)
```

- **PATIENT → APPOINTMENT:** One patient can have many appointments
- **HEALTH_WORKER → APPOINTMENT:** One health worker can handle many appointments
- **APPOINTMENT → DIAGNOSIS:** One appointment can result in many diagnoses
- **DIAGNOSIS → TREATMENT:** One diagnosis can have many treatment plans

> All foreign keys use **ON DELETE CASCADE** and **ON UPDATE CASCADE** to maintain data consistency across all related tables automatically.

---

## 🔧 Key Design Decisions

### Why we renamed `condition` to `condition_name`
The word `condition` is a **reserved keyword** in MySQL. Using it as a column name causes execution errors in certain MySQL versions. We renamed it to `condition_name` to avoid this conflict and ensure the database runs without errors.

### Why we use `DATETIME DEFAULT CURRENT_TIMESTAMP` for visit_date
We originally had separate `visit_date` (DATE) and `visit_time` (TIME) columns. We combined them into one `DATETIME` column with `DEFAULT CURRENT_TIMESTAMP` so the date and time of each appointment are captured together automatically in one field.

### Why `TREATMENT.status` defaults to `'Ongoing'`
New treatment records are automatically assigned the status `'Ongoing'` without requiring manual entry. This reduces the risk of null values in an important clinical field.

### Why all foreign keys use CASCADE
When a parent record is deleted or updated, all related child records are automatically updated or removed. This prevents orphaned records — for example, if a patient is deleted, all their appointments, diagnoses and treatments are also removed automatically.

---

## 📁 Repository Structure

```
📦 COMP102_GroupProject/
├── 📄 README.md                          ← You are here
├── 📄 BSEM1203F_Group4.sql               ← Complete SQL script file
├── 📄 Database_Project_Report.docx       ← Full written project report
└── 📄 Physical_Data_Model.pdf            ← Refined Physical Data Model diagram
```

---

## ▶️ How to Run This Project

### Requirements
- [XAMPP](https://www.apachefriends.org/) installed on your computer
- MySQL running through XAMPP Control Panel
- phpMyAdmin accessible via browser at `http://localhost/phpmyadmin`

### Steps

**Step 1:** Open XAMPP Control Panel and start **Apache** and **MySQL**

**Step 2:** Open your browser and go to:
```
http://localhost/phpmyadmin
```

**Step 3:** Click on the **SQL** tab in phpMyAdmin

**Step 4:** Copy the entire contents of `BSEM1203F_Group4.sql` and paste it into the SQL editor

**Step 5:** Click **Go** to execute the script

**Step 6:** The database `public_health_clinic_db` will be created automatically with all 5 tables and 20 records in each table

---

## 🔍 Sample Queries Included in the SQL File

The SQL script includes demonstrations of:

- `SELECT` — retrieve all records or specific columns
- `WHERE` — filter records by condition
- `BETWEEN` — find records within a range of values or dates
- `LIKE` — search for patterns in text (starts with, ends with, contains)
- `AND` / `OR` — combine multiple conditions
- `ORDER BY ASC/DESC` — sort records in ascending or descending order
- `LIMIT` / `OFFSET` — restrict how many records are returned
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` — aggregate functions
- `INSERT`, `UPDATE`, `DELETE` — data manipulation
- `CREATE USER`, `GRANT`, `REVOKE`, `DROP USER` — user management

---

## 👤 User Management

Three MySQL user accounts were created for this project, each assigned privileges appropriate to their role, following the **Principle of Least Privilege**:

| User Role | Privileges Granted |
|---|---|
| Database Administrator | ALL PRIVILEGES |
| Data Entry Operator | SELECT, INSERT, UPDATE |
| Reporting Analyst | SELECT only |

This reflects real-world clinical information governance where different staff members are only given access to what they need for their specific job.

---

## 🌍 Relevance to Sierra Leone and SDG 3

Sierra Leone faces significant public health challenges including high rates of **malaria**, **typhoid fever**, **maternal mortality**, and non-communicable diseases such as **hypertension** and **type 2 diabetes**.

The conditions, medications and health worker roles used in this database are directly drawn from real clinical scenarios encountered in Sierra Leone public health facilities. By digitising patient records, appointment tracking, diagnosis histories and treatment plans, this system directly supports:

- **SDG 3 Target 3.8** — Universal health coverage
- **SDG 3 Target 3.c** — Strengthening health system capacity

---

## 🔒 Important Notes

- This database was built and tested using **MySQL 8.0** via **XAMPP**
- All passwords used in the user management section are for demonstration purposes only
- The sample data uses fictional patient names but realistic Sierra Leonean clinical scenarios
- Plagiarism policy: this is original group work submitted for COMP 102 at Limkokwing University Sierra Leone

---

## 📬 Contact

**Examiner:** Sheik Umar Kanu
**Email:** sheikh.umar@limkokwing.edu.sl
**Institution:** Limkokwing University of Creative Technology – Sierra Leone Campus
