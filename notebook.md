## Tasks API

This API allows you to manage tasks and users with attributes such as `title`, `coins`, `user_id`, and `status`. It also includes user details like `name`, `email`, and `profile_picture`.

---

### **Endpoints**

#### **1. Login**
Authenticate via Google OAuth to get a JWT token.

```bash
# Step 1: Initiate Google OAuth Login
curl --get "http://localhost:4000/users/auth/google_oauth2"

# Step 2: Complete the login process in your browser.
# After login, you will receive a JSON response with the JWT token.

# Example Response:
# {
#   "token": "your_jwt_token_here",
#   "user": {
#     "id": 1,
#     "email": "example@example.com",
#     "name": "Example User",
#     "profile_picture": "https://example.com/profile.jpg"
#   }
# }

# Step 3: Save the token in a variable for later use
TOKEN="your_jwt_token_here"
```

---

#### **2. View All Tasks**
Retrieve all tasks in the system.

```bash
curl --get "http://localhost:4000/tasks" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

---

#### **3. Create a New Task**
Create a task with a specific status and assign it to a user.

```bash
curl -X POST "http://localhost:4000/tasks" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
        "title": "New Task",
        "coins": 10,
        "status": "todo",
        "user_id": 2
      }' | jq .
```

---

#### **4. View a Single Task**
Retrieve details for a specific task by ID.

```bash
curl --get "http://localhost:4000/tasks/1" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

---

#### **5. Update a Task**
Update the status or assignment of an existing task.

```bash
curl -X PUT "http://localhost:4000/tasks/1" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
        "status": "done",
        "user_id": 2
      }' | jq .
```

---

#### **6. Delete a Task**
Delete a task by ID.

```bash
curl -X DELETE "http://localhost:4000/tasks/1" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

---

#### **7. View Tasks Assigned to the Current User**
Retrieve tasks assigned to the logged-in user.

```bash
curl --get "http://localhost:4000/tasks/my_tasks" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

---

#### **8. View All Users**
Retrieve all users in the system, including their `name`, `email`, `coins`, and `profile_picture`.

```bash
curl --get "http://localhost:4000/users" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Example Response:**

```json
[
  {
    "id": 2,
    "name": "Alveta",
    "email": "alveta@gmail.com",
    "coins": 1806,
    "profile_picture": null
  },
  {
    "id": 1,
    "name": "Murileonsio",
    "email": "murileonsio@gmail.com",
    "coins": 2233,
    "profile_picture": null
  },
  {
    "id": 3,
    "name": "Murilo Ferreira",
    "email": "murilosilva448@gmail.com",
    "coins": 0,
    "profile_picture": "https://lh3.googleusercontent.com/a/ACg8ocKuqfNdw9A2zUTk1EY1CLJ-4EEdT_eIRO6R9tFRMO-JJcETI1bAwQ"
  }
]


```

### **9. View Current User Details**
Retrieve details of the currently authenticated user.

```bash
curl --get "http://localhost:4000/users/me" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Example Response:**

```json
{
  "id": 3,
  "email": "murilosilva448@gmail.com",
  "profile_picture": "https://lh3.googleusercontent.com/a/ACg8ocKuqfNdw9A2zUTk1EY1CLJ-4EEdT_eIRO6R9tFRMO-JJcETI1bAwQ",
  "coins": 1560
}
```

### **10. View All Projects**
Retrieve a list of all projects in the system, including their tasks.

```bash
curl --get "http://localhost:4000/projects" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Example Response:**

```json
[
  {
    "id": 1,
    "name": "Project Alpha",
    "description": "This is a sample project.",
    "tasks": [
      {
        "id": 1,
        "title": "Task 1",
        "status": "todo",
        "coins": 10,
        "user_id": 2
      },
      {
        "id": 2,
        "title": "Task 2",
        "status": "in_progress",
        "coins": 15,
        "user_id": 3
      }
    ]
  },
  {
    "id": 2,
    "name": "Project Beta",
    "description": "Another sample project.",
    "tasks": []
  }
]
```

---

### **11. Create a New Project**
Create a new project.

```bash
curl -X POST "http://localhost:4000/projects" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
        "name": "Project Gamma",
        "description": "This is a new project."
      }' | jq .
```

**Example Response:**

```json
{
  "id": 3,
  "name": "Project Gamma",
  "description": "This is a new project.",
  "tasks": []
}
```

---

### **12. View a Single Project**
Retrieve details of a specific project by ID, including its tasks.

```bash
curl --get "http://localhost:4000/projects/1" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Example Response:**

```json
{
  "id": 1,
  "name": "Project Alpha",
  "description": "This is a sample project.",
  "tasks": [
    {
      "id": 1,
      "title": "Task 1",
      "status": "todo",
      "coins": 10,
      "user_id": 2
    }
  ]
}
```

---

### **13. Delete a Project**
Delete a project by ID.

```bash
curl -X DELETE "http://localhost:4000/projects/1" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

#### **14. Create a Task Within a Project**
Send a `POST` request to the endpoint `/projects/:project_id/tasks` to create a new task under a specific project.

**Example Request:**

```bash
curl -X POST "http://localhost:4000/projects/1/tasks" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
        "title": "New Task for Project",
        "coins": 20,
        "status": "todo",
        "user_id": 2
      }' | jq .
```

**Example Response:**

```json
{
  "id": 4,
  "title": "New Task for Project",
  "status": "todo",
  "coins": 20,
  "user_id": 2,
  "project_id": 1,
  "created_at": "2024-11-21T12:34:56.789Z",
  "updated_at": "2024-11-21T12:34:56.789Z"
}
```

### **15. Dashboard Overview**
Retrieve a summary of key metrics for the system, including total counts of projects, users, and tasks, along with task status distribution and task completion rate.

**Example Request:**

```bash
curl --get "http://localhost:4000/dashboard/overview" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Example Response:**

```json
{
  "total_projects": 5,
  "total_users": 10,
  "total_tasks": 50,
  "task_status_counts": {
    "todo": 20,
    "in_progress": 15,
    "done": 15
  },
  "completion_rate": 30.0
}
```

---

### **16. Detailed Projects for Dashboard**
Retrieve a list of all projects with their associated tasks.

**Example Request:**

```bash
curl --get "http://localhost:4000/dashboard/detailed_projects" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Example Response:**

```json
[
  {
    "id": 1,
    "name": "Project Alpha",
    "description": "A sample project",
    "tasks": [
      {
        "id": 1,
        "title": "Task 1",
        "status": "todo",
        "coins": 10,
        "user_id": 2
      },
      {
        "id": 2,
        "title": "Task 2",
        "status": "done",
        "coins": 15,
        "user_id": 3
      }
    ]
  },
  {
    "id": 2,
    "name": "Project Beta",
    "description": "Another sample project",
    "tasks": []
  }
]
```

---

### **17. Users Summary**
Retrieve a summary of all users, including their task count and coin balance.

**Example Request:**

```bash
curl --get "http://localhost:4000/dashboard/users_summary" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Example Response:**

```json
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com",
    "coins": 100,
    "tasks_count": 5
  },
  {
    "id": 2,
    "name": "Jane Smith",
    "email": "jane.smith@example.com",
    "coins": 50,
    "tasks_count": 10
  }
]
```





---

### **Attributes**

#### **Task Attributes**
- **id**: Unique identifier for the task.
- **title**: Title of the task.
- **coins**: Coins associated with the task.
- **user_id**: ID of the user the task is assigned to.
- **status**: Status of the task (`"todo"`, `"in_progress"`, `"done"`).
- **created_at**: Timestamp when the task was created.
- **updated_at**: Timestamp when the task was last updated.

#### **User Attributes**
- **id**: Unique identifier for the user.
- **name**: Name of the user.
- **email**: Email of the user.
- **coins**: Coins associated with the user.
- **profile_picture**: URL of the user's profile picture (from Google OAuth).

---

### **Authorization**
All endpoints (except the OAuth login) require the `Authorization` header with a valid JWT token:

```bash
-H "Authorization: Bearer $TOKEN"
```

Replace `$TOKEN` with the variable containing the token obtained after logging in via Google OAuth.