🗳️ Online Voting System – Dockerized Full-Stack Application
🚀 Developed by:

👨‍💻 Mani (Manikanta Marada)
KL University – B.Tech CSE

📌 Overview

The Online Voting System is a complete full-stack web application built using:

ReactJS (Frontend)

Spring Boot (Backend)

MySQL (Database)

Docker & Docker Compose (Containerized Deployment)

This system allows users to sign up, log in, create polls, vote, and view results in real-time.

The entire project is fully containerized, making it super easy to deploy anywhere.

🧩 Features
👤 User Authentication

Sign up

Login

JWT-based authentication

Role-based access control (USER / ADMIN)

📊 Poll Management

Create new polls

Vote in polls

View poll results

Track user-created polls

🛡️ Secure Backend

Spring Security + JWT

BCrypt password encryption

Input validation

Role table auto-insertion (ROLE_USER / ROLE_ADMIN)

🐳 Dockerized Deployment

Frontend served via Nginx

Backend running on Spring Boot

MySQL running in its own container

Automatic DB table creation

Custom REST API URL passed using .env variables

🏗️ Project Architecture
Online_Voting_System/
│
├── Backend/      → Spring Boot (8081)
├── Frontend/     → React + Nginx (3000 → 80)
├── docker-compose.yml
└── README.md

⚙️ Tech Stack
Layer	Technology
Frontend	React, Ant Design, Axios
Backend	Spring Boot, Spring Security, JWT
Database	MySQL 8
Deployment	Docker, Docker Compose
Other	Hibernate, Maven
🐳 Docker Compose Setup

To build and run the system:

docker compose up --build


To stop everything:

docker compose down


To remove all data:

docker compose down --volumes --remove-orphans

🌐 Access the Application
Service	URL
Frontend	http://localhost:3000

Backend API	http://localhost:8081/api

MySQL (Workbench)	localhost:3307
🛠️ Environment Variables
📌 Frontend (REACT_APP_API_BASE_URL)
http://localhost:8081

📌 Backend (Spring Boot)
server.port=8081
spring.datasource.url=jdbc:mysql://mysql:3306/polling_app
spring.datasource.username=root
spring.datasource.password=30407
app.jwtSecret=JWTSuperSecretKey

📦 Database Structure
Tables created:

users

roles

user_roles

polls

choices

votes

Preloaded roles:
ROLE_USER
ROLE_ADMIN

📸 Screenshots (Optional)

(Add screenshots of UI if you want)

📚 How to Push to GitHub
echo "# Online_Voting_System-Docker" >> README.md
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/MANIKANTA-MARADA/Online_Voting_System-Docker.git
git push -u origin main

🧑‍💻 Author

Manikanta Marada
Developer | Student at KL University
🔗 GitHub: https://github.com/MANIKANTA-MARADA
