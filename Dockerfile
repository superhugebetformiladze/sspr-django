# Образ Python
FROM python:3.8

# Установка зависимости
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Копирование кода в образ
COPY . /app

# Определение переменных среды
ENV DJANGO_SETTINGS_MODULE=sspr2.settings

# Выполнение миграций и запуск сервера
RUN python sspr2/manage.py migrate
CMD ["python", "sspr2/manage.py", "runserver", "0.0.0.0:8000"]
