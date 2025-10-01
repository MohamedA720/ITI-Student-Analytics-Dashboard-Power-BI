# 🎓 ITI Student Analytics Dashboard – Power BI Project

This project presents a comprehensive analytics solution for educational performance and student tracking at ITI (Information Technology Institute), using Power BI dashboards fed by a robust Data Warehouse built from an OLTP database.

---
## 🔗 Project Links

- 🔎 View project on [https://project.novypro.com/OqbSdH](#)

---
## 🏹 Workflow (Notion)
Check our workflow from the link below:
https://www.notion.so/ITI-Project-Manager-202929db3d5a808bb1e8c3e2ea9f3c7b?source=copy_link


## 🗃️ Database Structure (OLTP)

The original database represents a transactional system used to store daily operations such as student registrations, exams, course enrollments, certifications, and employment data.

### 🔸 Key Tables in the OLTP:

- `Student`: contains student personal details, intake, track, and branch
- `Exam`: records exams for different courses
- `Question`: details all exam questions (TF/MCQ)
- `Student_Exam`: links students to exams and stores results
- `Student_Exam_Question`: logs individual answers per student per question
- `Certificate`: issued to students for course completion
- `Job_Offer`: tracks employment offers given to students
- `Freelance_Project`: stores freelance project data per student

The OLTP is normalized for efficient transactions but not optimized for analysis.

---

## 🧠 Data Warehouse Design

We implemented a **Galaxy Schema** (also called Fact Constellation Schema) to support analytical needs across multiple entities such as Students, Courses, Exams, Instructors, Tracks, Certificates, Jobs, etc.

### ✅ Fact Tables:

| Fact Table              | Description                                      |
|-------------------------|--------------------------------------------------|
| `Fact_Student_Exam`     | Links students to exams and stores grades        |
| `Fact_Question_Response`| Stores individual question responses             |
| `Fact_Student_Certificate` | Tracks issued certificates per student       |
| `Fact_Job_Offer`        | Links students to job offers                     |
| `Fact_Freelance_Project`| Tracks freelance projects by students            |

### 🧩 Dimension Tables:

| Dimension Table | Description |
|------------------|-------------|
| `Dim_Student` | Full student info including gender, branch, intake, track |
| `Dim_Course` | Course names, durations, difficulty |
| `Dim_Exam` | Exam metadata |
| `Dim_Question` | Question type, topic, linked course |
| `Dim_Topic` | Topic classification for questions |
| `Dim_Track` | Specialization paths (Web, Data, AI...) |
| `Dim_Branch` | Location of ITI branches |
| `Dim_Intake` | Batch/season the student enrolled in |
| `Dim_Instructor` | Teacher information |
| `Dim_Certificate`, `Dim_Job`, `Dim_Country` | Extra supporting attributes |

---

## ⚙️ ETL Process (SSIS)

We used SQL Server Integration Services (SSIS) for data extraction, transformation, and loading from OLTP to DWH.

### 🔄 ETL Highlights:

- **Extract**: from normalized OLTP tables
- **Transform**:
  - `Lookup` to find matching IDs
  - `Conditional Split` to filter new/updated records
  - **SCD Type 2** used for tables like `Dim_Student` to track history
- **Load**: insert into fact/dimension tables in staging → DWH

---

## 📊 Power BI Dashboards

A total of **20+ dashboards** are implemented, grouped by theme:

- **Student Dashboards**: Performance, Gender Analysis, Branch Comparison, Pathways
- **Exam Dashboards**: MCQ/TF insights, Exam Outcomes, Course-based Exam Trends
- **Course Dashboards**: Engagement, Completion, Popularity
- **Instructor Dashboards**: Workload, Evolution
- **Job & Freelance Dashboards**: Employment KPIs, Certificate Impact
- **Time-Based Dashboards**: Seasonal and Trend Analytics
- **Global Overview Home Page**: Allows easy navigation across categories

---

## 📌 Technologies Used

- Power BI
- SQL Server (OLTP & DWH)
- SSIS (ETL)
- SSRS (Reports)
- DAX
- dbdiagram.io (ERD)
- Notion

---


## 👤 Author
- **Mohamed Ahmed**
[https://www.linkedin.com/in/mohamed-ahmed57/](#)
- **Mohamed Saeed**  
[https://www.linkedin.com/in/mohammedsaeed12/](#)
- **Karim Ayman**
[https://www.linkedin.com/in/karim-ayman-40b750320/](#)
- **Youssef Mohsen**
[https://www.linkedin.com/in/youssefmohsen3500/](#)
- **Kareem Emad**
[https://www.linkedin.com/in/kareem-emad0/](#)


# ITI-Student-Analytics-Dashboard-Power-BI
