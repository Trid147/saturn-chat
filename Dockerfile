FROM python:3.11-slim

LABEL org.opencontainers.image.source="https://github.com/trid147/saturn-chat"

WORKDIR /app
ENV PYTHONUNBUFFERED=1

RUN useradd -u 1001 saturn_chat_user

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=saturn_chat_user:saturn_chat_user core/server.py /app/server.py
RUN mkdir -p /app/data && chown -R saturn_chat_user:saturn_chat_user /app/data

USER saturn_chat_user

CMD ["python", "server.py"]