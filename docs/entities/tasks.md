# Tasks API

A task represents a unit of work or activity that needs to be completed. It includes details such as its title, associated coins (a reward or value metric), the user responsible, its current status (e.g., "todo", "in_progress", "done"), and optional attributes like priority, due date, and description. Tasks can also be linked to specific projects, providing a structured way to organize and track work effectively.

---

### **Attributes**

- **id**: Unique identifier for the task.
- **title**: Title of the task.
- **coins**: Coins associated with the task.
- **user_id**: ID of the user the task is assigned to.
- **description**: Description of the task in Markdown format.
- **status**: Status of the task (`"todo"`, `"in_progress"`, `"done"`).
- **priority**: Priority of the task (`"low"`, `"medium"`, `"high"`).
- **due_date**: Date by which the task must be completed.
- **created_at**: Timestamp when the task was created.
- **updated_at**: Timestamp when the task was last updated.

---

### **Endpoints**

#### **1. View All Tasks**
Retrieve all tasks in the system.

```bash
curl --get "http://localhost:4000/tasks" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Expected Response:**

```json
[
  {
    "id": 1,
    "title": "Prepare project presentation",
    "coins": 50,
    "status": "done",
    "priority": "high",
    "due_date": "2024-12-05",
    "description": "Create a **PowerPoint** presentation for the **end-of-year project review**.",
    "created_at": "2024-11-28T03:49:09.871Z",
    "updated_at": "2024-12-01T10:15:09.871Z",
    "project": {
      "id": 1,
      "name": "End-of-Year Review",
      "description": "Tasks related to the final review meeting for 2024.",
      "created_at": "2024-11-28T03:48:52.124Z",
      "updated_at": "2024-11-28T03:48:52.124Z"
    },
    "user": {
      "id": 1,
      "email": "jane.doe@example.com",
      "name": "Jane Doe",
      "coins": 150,
      "profile_picture": "https://example.com/profile/jane.jpg"
    }
  },
  {
    "id": 2,
    "title": "Code review for authentication module",
    "coins": 30,
    "status": "in_progress",
    "priority": "medium",
    "due_date": "2024-12-02",
    "description": "Review the **authentication module code** for potential bugs and improvements.",
    "created_at": "2024-11-29T02:17:54.673Z",
    "updated_at": "2024-12-01T09:00:00.000Z",
    "project": {
      "id": 2,
      "name": "Authentication System",
      "description": "Develop and maintain the system's login and security features.",
      "created_at": "2024-11-28T03:48:52.124Z",
      "updated_at": "2024-11-28T03:48:52.124Z"
    },
    "user": {
      "id": 2,
      "email": "john.doe@example.com",
      "name": "John Doe",
      "coins": 200,
      "profile_picture": "https://example.com/profile/john.jpg"
    }
  }
]
```

---

#### **2. Create a New Task**
Create a task with a specific status and assign it to a user.

```bash
curl -X POST "http://localhost:4000/tasks" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
        "title": "Write API documentation",
        "coins": 20,
        "status": "todo",
        "priority": "high",
        "user_id": 1,
        "description": "Write the **API documentation** for the upcoming release, ensuring all endpoints are documented."
      }' | jq .
```

**Expected Response:**

```json
{
  "id": 3,
  "title": "Write API documentation",
  "coins": 20,
  "status": "todo",
  "priority": "high",
  "due_date": null,
  "description": "Write the **API documentation** for the upcoming release, ensuring all endpoints are documented.",
  "created_at": "2024-12-01T23:21:51.135Z",
  "updated_at": "2024-12-01T23:21:51.135Z",
  "project": null,
  "user": {
    "id": 1,
    "email": "jane.doe@example.com",
    "name": "Jane Doe",
    "coins": 170,
    "profile_picture": "https://example.com/profile/jane.jpg"
  }
}
```

---

#### **3. View a Single Task**
Retrieve details for a specific task by ID.

```bash
curl --get "http://localhost:4000/tasks/1" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Expected Response:**

```json
{
  "id": 1,
  "title": "Prepare project presentation",
  "coins": 50,
  "status": "done",
  "priority": "high",
  "due_date": "2024-12-05",
  "description": "Create a **PowerPoint** presentation for the **end-of-year project review**.",
  "created_at": "2024-11-28T03:49:09.871Z",
  "updated_at": "2024-12-01T10:15:09.871Z",
  "project": {
    "id": 1,
    "name": "End-of-Year Review",
    "description": "Tasks related to the final review meeting for 2024.",
    "created_at": "2024-11-28T03:48:52.124Z",
    "updated_at": "2024-11-28T03:48:52.124Z"
  },
  "user": {
    "id": 1,
    "email": "jane.doe@example.com",
    "name": "Jane Doe",
    "coins": 150,
    "profile_picture": "https://example.com/profile/jane.jpg"
  }
}
```

---

#### **4. Update a Task**
Update the status or assignment of an existing task.

```bash
curl -X PUT "http://localhost:4000/tasks/1" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
        "status": "done",
        "priority": "high",
        "user_id": 1
      }' | jq .
```

**Expected Response:**

```json
{
  "id": 1,
  "title": "Prepare project presentation",
  "coins": 50,
  "status": "done",
  "priority": "high",
  "due_date": "2024-12-05",
  "description": "Create a **PowerPoint** presentation for the **end-of-year project review**.",
  "created_at": "2024-11-28T03:49:09.871Z",
  "updated_at": "2024-12-01T10:15:09.871Z",
  "project": {
    "id": 1,
    "name": "End-of-Year Review",
    "description": "Tasks related to the final review meeting for 2024.",
    "created_at": "2024-11-28T03:48:52.124Z",
    "updated_at": "2024-11-28T03:48:52.124Z"
  },
  "user": {
    "id": 1,
    "email": "jane.doe@example.com",
    "name": "Jane Doe",
    "coins": 150,
    "profile_picture": "https://example.com/profile/jane.jpg"
  }
}
```

---

#### **5. Delete a Task**
Delete a task by ID.

```bash
curl -X DELETE "http://localhost:4000/tasks/1" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Expected Response:**

_No content or success message returned._

---

#### **6. View Tasks Assigned to the Current User**
Retrieve tasks assigned to the logged-in user.

```bash
curl --get "http://localhost:4000/tasks/my_tasks" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

**Expected Response:**

```json
[
  {
    "id": 2,
    "title": "Code review for authentication module",
    "coins": 30,
    "status": "in_progress",
    "priority": "medium",
    "due_date": "2024-12-02",
    "description": "Review the **authentication module code** for potential bugs

 and improvements.",
    "created_at": "2024-11-29T02:17:54.673Z",
    "updated_at": "2024-12-01T09:00:00.000Z",
    "project": {
      "id": 2,
      "name": "Authentication System",
      "description": "Develop and maintain the system's login and security features.",
      "created_at": "2024-11-28T03:48:52.124Z",
      "updated_at": "2024-11-28T03:48:52.124Z"
    },
    "user": {
      "id": 2,
      "email": "john.doe@example.com",
      "name": "John Doe",
      "coins": 200,
      "profile_picture": "https://example.com/profile/john.jpg"
    }
  }
]
```
