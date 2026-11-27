FROM python:3.11-slim

WORKDIR /app

RUN useradd -u 1001 saturn_chat_user

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=saturn_chat_user:saturn_chat_user core .

USER saturn_chat_user

CMD ["python", "server.py"]
