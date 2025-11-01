import asyncdispatch, httpclient, json, strutils

const api = "https://tempmail.now"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "Host": "tempmail.now",
    "Content-Type": "application/json",
    "accept": "application/json, text/plain, */*"
  })

proc create_email*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.post(api & "/change_email",body="")
    let body = await response.body
    if response.headers.hasKey("set-cookie"):
      headers["cookie"] = response.headers["set-cookie"]
    result = parseJson(body)
  finally:
    client.close()


proc get_messages*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/fetch_emails")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
