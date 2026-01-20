Secure-CRUD 🐳

A production-style, multi-container CRUD application demonstrating secure containerization, reverse proxying, automation, and persistence using Docker.

This project was built as part of the Secure-CRUD assignment, focusing on real-world DevOps and container best practices.

📌 Project Overview

Secure-CRUD is a simple CRUD (Create, Read, Update, Delete) application deployed using a three-tier container architecture:

Nginx → Reverse Proxy (only exposed service)

Node.js (Express) → Application logic

MongoDB → Persistent data storage

All services communicate over a private Docker network, ensuring isolation and security.

🏗 Architecture
Client
  │
  ▼
┌──────────────┐
│   Nginx      │  (Port 80 exposed)
│ Reverse Proxy│
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  Node.js App │  (Internal only)
│  Express API │
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  MongoDB     │  (Internal only)
│  Persistent  │
└──────────────┘

✅ Assignment Requirements Coverage
Requirement	Status
CRUD operations	✅
Multi-container system	✅
Nginx reverse proxy	✅
Network isolation	✅
Non-root application container	✅
Environment variables for secrets	✅
Persistent storage	✅
Automated deployment script	✅
Health checks	✅
CI/CD ready	✅
🧱 Tech Stack

Backend: Node.js + Express

Database: MongoDB

Proxy: Nginx

Containerization: Docker & Docker Compose

Automation: Bash (deploy.sh)

📂 Repository Structure
.
├── src/                 # Application source code
│   ├── index.js
│   ├── routes.js
│   └── db.js
├── nginx/               # Nginx configuration
│   ├── nginx.conf
│   └── Dockerfile
├── Dockerfile            # App container
├── docker-compose.yml    # Multi-container orchestration
├── deploy.sh             # Automated deployment script
├── .env                  # Environment variables
└── README.md

⚙️ Prerequisites

Make sure the following are installed:

Docker

Docker Compose

Git Bash / Linux shell / macOS Terminal

🚀 How to Run the Application
1️⃣ Clone the Repository
git clone <your-github-repo-url>
cd secure-crud

2️⃣ Run the Deployment Script
chmod +x deploy.sh
./deploy.sh


The script will:

Verify Docker & Docker Compose

Stop and clean old containers

Build all images

Start services

Wait until the app is healthy

When ready, you will see:

[SUCCESS] Application is live at http://localhost

🌐 API Endpoints

All endpoints are accessed through Nginx (port 80).

Create a Task
POST /api/tasks

{
  "title": "My Task",
  "completed": false
}

Get All Tasks
GET /api/tasks

Update a Task
PUT /api/tasks/:id

{
  "completed": true
}

Delete a Task
DELETE /api/tasks/:id

💾 Data Persistence

MongoDB data is stored in a Docker volume

Data remains intact across:

Container restarts

Docker restarts

System reboots

🔐 Security Considerations

Only Nginx exposes a port to the host

App and database are isolated in a private network

Application container runs as a non-root user

Secrets are injected via environment variables

🔄 CI/CD (GitHub Actions)

This project is CI/CD ready.

The pipeline (to be added in .github/workflows/) will:

Trigger on push to main

Build Docker image

Tag image (latest + commit SHA)

Push to Docker Hub (public repository)

🧪 Health Checks

The deployment script verifies application readiness by polling:

http://localhost/api/tasks


The success message is printed only after the system is fully operational.

🧑‍💻 Author

Mainak Saha

📎 Submission Notes

This repository follows the exact structure required by the assignment

The project demonstrates real-world containerized deployment practices

Fully runnable using a single command