# Используем универсальный devcontainer образ Microsoft
FROM mcr.microsoft.com/devcontainers/universal:latest

# Устанавливаем Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Экспонируем порт для Ollama API
EXPOSE 11434

# Устанавливаем дополнительные утилиты (опционально)
RUN apt-get update && apt-get install -y \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*

