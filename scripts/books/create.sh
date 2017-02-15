#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/books"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "book": {
      "title": "'"${TITLE}"'",
      "author": "'"${AUTHOR}"'",
      "published_in": "'"${DATE}"'"
    }
  }'
  # --header "Authorization: Token token=$TOKEN"

echo
