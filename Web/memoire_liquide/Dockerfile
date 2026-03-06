FROM python:3.11-slim
WORKDIR /app/l

COPY chall/ /app/chall

RUN pip install --no-cache-dir Flask itsdangerous

WORKDIR /app/chall

EXPOSE 5000
CMD ["python", "app.py"]
