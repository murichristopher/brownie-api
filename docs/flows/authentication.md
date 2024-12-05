# Authentication Flow

Authenticate users via Google OAuth and obtain a JWT token for subsequent requests.

---

### **Endpoints**

#### **1. Login**
Initiate Google OAuth login and receive a JWT token.

```bash
curl --get "http://localhost:4000/users/auth/google_oauth2"
```

Complete the login process in the browser. Save the token for subsequent API calls.

---

#### **Authorization**
Use the JWT token in the `Authorization` header:

```bash
-H "Authorization: Bearer $TOKEN"
```

