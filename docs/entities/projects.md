# Projects API

Manage projects and their associated tasks.

---

### **Endpoints**

#### **10. View All Projects**
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

#### **11. Create a New Project**
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

#### **12. View a Single Project**
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

#### **13. Delete a Project**
Delete a project by ID.

```bash
curl -X DELETE "http://localhost:4000/projects/1" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

---

#### **14. Create a Task Within a Project**
Create a new task under a specific project.

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