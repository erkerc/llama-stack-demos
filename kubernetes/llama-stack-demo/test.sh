#!/bin/bash

# Define the API endpoint URL and a potential API key
# IMPORTANT: Replace "http://localhost:8000/v1/chat/completions" with your actual VLLM server address.
API_URL="https://qwen25-vl-3b-instruct-document-chat.apps.cluster-kqpr6.kqpr6.sandbox3277.opentlc.com/v1/chat/completions"
# Most APIs require an API key. For local VLLM, it might be a placeholder like "EMPTY".
# Replace "EMPTY" if your service requires a real key.
API_KEY="EMPTY"

# The message payload, formatted as a JSON string for the 'data' field in curl.
# Note that single quotes are used to wrap the JSON, so double quotes inside don't need to be escaped.
DATA_PAYLOAD='{
    "model": "qwen25-vl-3b-instruct",
    "messages": [
        {
            "role": "user",
            "content": [
                {
                    "type": "image_url",
                    "image_url": {
                        "url": "https://qianwen-res.oss-cn-beijing.aliyuncs.com/Qwen-VL/assets/demo.jpeg"
                    }
                },
                {
                    "type": "text",
                    "text": "Describe this image."
                }
            ]
        }
    ],
    "max_tokens": 2048,
    "temperature": 0.7
}'

# Execute the curl command
# -X POST: Specifies the HTTP POST method.
# -H "Content-Type: application/json": Sets the content type header.
# -H "Authorization: Bearer $API_KEY": Sets the authorization header.
# -d "$DATA_PAYLOAD": Sends the JSON data as the request body.
curl "$API_URL" \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_KEY" \
    -d "$DATA_PAYLOAD"



