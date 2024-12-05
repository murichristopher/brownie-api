# Dashboard Flow

Retrieve system-wide metrics and summaries.

---

### **Endpoints**

#### **1. Dashboard Overview**
Retrieve a summary of key metrics for the system.

```bash
curl --get "http://localhost:4000/dashboard/overview" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

---

#### **2. Detailed Projects**
Retrieve a list of all projects with their associated tasks.

```bash
curl --get "http://localhost:4000/dashboard/detailed_projects" \
  -H "Authorization: Bearer $TOKEN" | jq .
```

