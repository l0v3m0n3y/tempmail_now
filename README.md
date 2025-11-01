# tempmail_now
temp email web api tempmail.now
# Example
```nim
import asyncdispatch, tempmail_now, json
let data = waitFor create_email()
echo data["new_email"].getStr
```
# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
