# Authorization

---

All endpoints (except the OAuth login) require the `Authorization` header with a valid JWT token:

```bash
-H "Authorization: Bearer $TOKEN"
```

Replace `$TOKEN` with the variable containing the token obtained after logging in via Google OAuth.

