Terraform Plan (plan.txt)
         |
         v
Trim & Encode (jq -Rs + head -n 300)
         |
         v
Build JSON Payload (payload.json)
         |
         v
Send to OpenAI API (curl with API key)
         |
         v
Receive Response (BODY + STATUS)
         |
     +------------------+
     | STATUS == 200 ?  |
     +------------------+
        |        |
       Yes       No
        |        |
        v        v
 Extract AI     Save Raw
 Summary        Error Msg
 (jq parse)     (debug info)
        |
        v
Write to summary.txt
        |
        v
Display in GitHub Actions Summary Page
