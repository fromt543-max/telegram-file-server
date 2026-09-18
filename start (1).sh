#!/bin/sh
set -e

if [ -z "$TELEGRAM_API_ID" ] || [ -z "$TELEGRAM_API_HASH" ]; then
  echo "❌ TELEGRAM_API_ID / TELEGRAM_API_HASH មិនទាន់កំណត់ទេ — យកពី https://my.telegram.org"
  exit 1
fi

echo "🚀 កំពុង Start telegram-bot-api (Local Mode) នៅ Port 8081..."
telegram-bot-api \
  --api-id="$TELEGRAM_API_ID" \
  --api-hash="$TELEGRAM_API_HASH" \
  --local \
  --http-port=8081 \
  --dir=/var/lib/telegram-bot-api \
  &

echo "🚀 កំពុង Start File Server (HTTP Read-Only) នៅ Port 8080..."
# Serve /var/lib/telegram-bot-api ជា Plain HTTP ឲ្យ Service ដទៃទៀត (bot.py) អាច
# Download File ធំៗបានតាម URL ធម្មតា ដោយមិនតម្រូវ Filesystem Access ដូចគ្នា។
python3 -m http.server 8080 --directory /var/lib/telegram-bot-api &

wait -n
