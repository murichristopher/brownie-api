# Users API

Manage users and their associated attributes such as `name`, `email`, `coins`, and `profile_picture`.

---

### **Endpoints**

#### **1. View All Users**
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

---

#### **2. View Current User Details**
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