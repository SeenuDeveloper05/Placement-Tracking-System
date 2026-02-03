# Placement Eligibility & Application Tracking System

## 📌 Project Overview
The Placement Eligibility & Application Tracking System is a web-based application developed to simulate a real-time college placement process.  
It allows students to check their eligibility for companies and apply for jobs, while admins manage students, companies, and application statuses.

---

## 🎯 Objectives
- To automate the placement eligibility process  
- To allow students to apply only for eligible companies  
- To provide admins with complete control over students, companies, and applications  

---

## 👥 User Roles
### 1. Student
- Register and login
- View eligible companies based on CGPA, arrears, and skills
- Apply for companies
- View application status

### 2. Company
- Register and login
- Define eligibility criteria (minimum CGPA, max arrears, required skills)

### 3. Admin
- Login with secure authentication
- View all students and companies
- Match eligible students for companies
- View and update application status (Applied / Shortlisted / Rejected)

---

## 🛠 Technologies Used
- **Java**
- **JSP (Java Server Pages)**
- **Servlets**
- **JDBC**
- **MySQL**
- **HTML & CSS**
- **Apache Tomcat**

---

## 🗄 Database Design
The project uses a relational database with the following tables:
- `students`
- `companies`
- `applications`
- `admin`

Relationships are maintained using primary and foreign keys to ensure data consistency.

---

## ⚙ Key Features
- Role-based authentication (Student / Company / Admin)
- Session management for secure access
- Eligibility matching logic using CGPA, arrears, and skills
- Application tracking system with status updates
- Clean and consistent UI using reusable CSS

---

## 🚀 How to Run the Project
1. Install **Apache Tomcat**
2. Import the project into **NetBeans / Eclipse**
3. Configure MySQL database and update DB credentials
4. Create required tables using provided SQL scripts
5. Run the project on Tomcat server
6. Access the application via browser

---

## 📚 What I Learned
- Backend development using Java Servlets
- Database connectivity using JDBC
- SQL queries and joins
- Session handling and authentication
- End-to-end web application flow

---

## 💡 Future Enhancements
- Password-based authentication
- Resume upload feature for students
- Email notifications for application status
- Pagination and search functionality

---

## 👤 Author
**Seenu**  
Java Backend Developer (Fresher)

---

## 📎 Note
This project is built for learning and academic purposes and follows real-world placement workflow concepts.
