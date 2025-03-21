# Task-Flow
Микросервис для управления задачами с поддержкой трекинга изменений


## Запуск проекта

### Предварительные требования
- Docker desktop

### Клонировать репозиторий
```bash
git clone https://github.com/Pavel5807/TaskFlow.git
```
### Запустить контейнеры
```bash
docker compose -f 'src\docker-compose.yml' -f 'src\docker-compose.override.yml' up -d --build
```
