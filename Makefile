.PHONY: init update dev frontend-web frontend-mobile backend ai

# Init: clone & init submodules
init:
	@echo "🔧 Initializing submodules..."
	git submodule update --init --recursive

# Pull latest for each submodule
update:
	@echo "📦 Updating submodules..."
	git submodule foreach git pull origin main

# Run dev server for all
dev: frontend-web frontend-mobile backend ai

frontend-web:
	@echo "🌐 Starting Frontend Web..."
	cd frontend-web && npm install && npm run dev

frontend-mobile:
	@echo "📱 Starting Frontend Mobile (Flutter)..."
	cd frontend-mobile && flutter pub get && flutter run

backend:
	@echo "🖥️ Starting Backend..."
	cd backend && cd Backend && npm install && npm run dev

# Mac & Linux
# ai:
# 	@echo "🧠 Starting AI Server..."
# 	cd ai && python -m venv venv && source venv/bin/activate && pip install -r requirements.txt && python main.py

# Windows
ai:
	@echo "🧠 Starting AI Server..."
	cd ai && python -m venv venv && venv/Scripts/activate && pip install -r requirements.txt && python app.py