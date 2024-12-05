#!/bin/bash

# Create folders
mkdir -p docs/entities docs/flows docs/reference

# Create and populate files

# Tasks.md
cat <<EOL > docs/entities/tasks.md
# Tasks API

Manage tasks with attributes such as \`title\`, \`coins\`, \`user_id\`, and \`status\`.

---

### **Endpoints**

#### **1. View All Tasks**
Retrieve all tasks in the system.

\`\`\`bash
curl --get "http://localhost:4000/tasks" \\
  -H "Authorization: Bearer \$TOKEN" | jq .
\`\`\`

---

#### **2. Create a New Task**
Create a task with a specific status and assign it to a user.

\`\`\`bash
curl -X POST "http://localhost:4000/tasks" \\
  -H "Authorization: Bearer \$TOKEN" \\
  -H "Content-Type: application/json" \\
  -d '{
        "title": "New Task",
        "coins": 10,
        "status": "todo",
        "user_id": 2
      }' | jq .
\`\`\`

EOL

# Users.md
cat <<EOL > docs/entities/users.md
# Users API

Manage users and their associated attributes such as \`name\`, \`email\`, and \`coins\`.

---

### **Endpoints**

#### **1. View All Users**
Retrieve all users in the system.

\`\`\`bash
curl --get "http://localhost:4000/users" \\
  -H "Authorization: Bearer \$TOKEN" | jq .
\`\`\`

---

#### **2. View Current User Details**
Retrieve details of the currently authenticated user.

\`\`\`bash
curl --get "http://localhost:4000/users/me" \\
  -H "Authorization: Bearer \$TOKEN" | jq .
\`\`\`

EOL

# Projects.md
cat <<EOL > docs/entities/projects.md
# Projects API

Manage projects and their associated tasks.

---

### **Endpoints**

#### **1. View All Projects**
Retrieve all projects in the system.

\`\`\`bash
curl --get "http://localhost:4000/projects" \\
  -H "Authorization: Bearer \$TOKEN" | jq .
\`\`\`

---

#### **2. Create a New Project**
Create a new project.

\`\`\`bash
curl -X POST "http://localhost:4000/projects" \\
  -H "Authorization: Bearer \$TOKEN" \\
  -H "Content-Type: application/json" \\
  -d '{
        "name": "Project Gamma",
        "description": "This is a new project."
      }' | jq .
\`\`\`

EOL

# Authentication.md
cat <<EOL > docs/flows/authentication.md
# Authentication Flow

Authenticate users via Google OAuth and obtain a JWT token for subsequent requests.

---

### **Endpoints**

#### **1. Login**
Initiate Google OAuth login and receive a JWT token.

\`\`\`bash
curl --get "http://localhost:4000/users/auth/google_oauth2"
\`\`\`

Complete the login process in the browser. Save the token for subsequent API calls.

---

#### **Authorization**
Use the JWT token in the \`Authorization\` header:

\`\`\`bash
-H "Authorization: Bearer \$TOKEN"
\`\`\`

EOL

# Dashboard.md
cat <<EOL > docs/flows/dashboard.md
# Dashboard Flow

Retrieve system-wide metrics and summaries.

---

### **Endpoints**

#### **1. Dashboard Overview**
Retrieve a summary of key metrics for the system.

\`\`\`bash
curl --get "http://localhost:4000/dashboard/overview" \\
  -H "Authorization: Bearer \$TOKEN" | jq .
\`\`\`

---

#### **2. Detailed Projects**
Retrieve a list of all projects with their associated tasks.

\`\`\`bash
curl --get "http://localhost:4000/dashboard/detailed_projects" \\
  -H "Authorization: Bearer \$TOKEN" | jq .
\`\`\`

EOL

# Attributes.md
cat <<EOL > docs/reference/attributes.md
# API Attributes

---

## **Task Attributes**
- **id**: Unique identifier for the task.
- **title**: Title of the task.
- **coins**: Coins associated with the task.
- **user_id**: ID of the user the task is assigned to.
- **status**: Status of the task (\`"todo"\`, \`"in_progress"\`, \`"done"\`).

---

## **User Attributes**
- **id**: Unique identifier for the user.
- **name**: Name of the user.
- **email**: Email of the user.
- **coins**: Coins associated with the user.
- **profile_picture**: URL of the user's profile picture (from Google OAuth).

EOL

# Authorization.md
cat <<EOL > docs/reference/authorization.md
# Authorization

---

All endpoints (except the OAuth login) require the \`Authorization\` header with a valid JWT token:

\`\`\`bash
-H "Authorization: Bearer \$TOKEN"
\`\`\`

Replace \`\$TOKEN\` with the variable containing the token obtained after logging in via Google OAuth.

EOL

echo "Documentation structure and content created successfully!"
