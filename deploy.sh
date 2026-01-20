#!/bin/bash
set -e

echo "[INFO] Checking prerequisites..."

command -v docker >/dev/null 2>&1 || {
  echo "[ERROR] Docker is not installed"
  exit 1
}

command -v docker-compose >/dev/null 2>&1 || {
  echo "[ERROR] Docker Compose is not installed"
  exit 1
}

echo "[INFO] Stopping existing containers..."
docker-compose down -v --remove-orphans

echo "[INFO] Building and starting containers..."
docker-compose up --build -d

echo "[INFO] Waiting for application to become healthy..."

MAX_RETRIES=30
SLEEP_TIME=2
RETRY_COUNT=0

until curl -s http://localhost/api/tasks >/dev/null; do
  RETRY_COUNT=$((RETRY_COUNT + 1))

  if [ "$RETRY_COUNT" -ge "$MAX_RETRIES" ]; then
    echo "[ERROR] Application failed to become healthy"
    docker-compose logs
    exit 1
  fi

  echo "[INFO] Waiting... ($RETRY_COUNT/$MAX_RETRIES)"
  sleep $SLEEP_TIME
done

echo "[SUCCESS] Application is live at http://localhost"
