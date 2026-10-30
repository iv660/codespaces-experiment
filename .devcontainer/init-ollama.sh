#!/bin/bash

# Запускаем Ollama сервер в фоне
echo "🚀 Запуск Ollama сервера..."
ollama serve > /tmp/ollama.log 2>&1 &
OLLAMA_PID=$!

# Ждём, пока сервер запустится
echo "⏳ Ожидание инициализации Ollama..."
sleep 5

# Проверяем, что сервер работает
if curl -s http://localhost:11434/api/tags > /dev/null; then
  echo "✅ Ollama сервер запущен (PID: $OLLAMA_PID)"
else
  echo "❌ Ошибка при запуске Ollama"
  exit 1
fi

# Загружаем модель (если её ещё нет)
echo "📥 Загрузка модели mistral (если не загружена)..."
ollama pull mistral

echo "✅ Инициализация завершена!"
