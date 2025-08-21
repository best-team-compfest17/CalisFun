#!/bin/bash

# Fungsi: Inisialisasi submodules
function init() {
  echo "🔧 Initializing submodules..."
  git submodule update --init --recursive
}

# Fungsi: Update semua submodule
function update() {
  echo "📦 Updating submodules..."
  git submodule foreach git pull origin main
}

# --- FRONTEND WEB ---
function frontend_web() {
  echo "🌐 Starting Frontend Web..."
  cd frontend-web || exit
  npm install
  npm run dev
  cd ..
}

# --- FRONTEND MOBILE (Flutter) ---
function frontend_mobile() {
  echo "📱 Starting Frontend Mobile (Flutter)..."
  cd frontend-mobile || exit
  flutter pub get
  flutter run
  cd ..
}

# --- BACKEND ---
function backend() {
  echo "🖥️ Starting Backend..."
  cd backend || exit
  npm install
  npm run dev
  cd ..
}

# --- AI SERVER ---
function ai() {
  echo "🧠 Starting AI Server..."
  cd ai || exit
  python -m venv venv
  # source venv/bin/activate  # untuk Linux/Mac
  source venv/Scripts/activate  # kalau Windows PowerShell/GitBash
  pip install -r requirements.txt
  python app.py
  cd ..
}

# Jalankan semua service
function dev() {
  frontend_web &
  frontend_mobile &
  backend &
  ai
}

# Routing argumen
case "$1" in
  init)
    init
    ;;
  update)
    update
    ;;
  dev)
    dev
    ;;
  frontend-web)
    frontend_web
    ;;
  frontend-mobile)
    frontend_mobile
    ;;
  backend)
    backend
    ;;
  ai)
    ai
    ;;
  *)
    echo "❌ Unknown command: $1"
    echo "Usage: ./scripts/dev.sh [init|update|dev|frontend-web|frontend-mobile|backend|ai]"
    ;;
esac
