FROM python:3.11-slim

# Install security updates
RUN apt-get update && apt-get upgrade -y && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app 
EXPOSE 5000

CMD ["sh", "-c", "ls -la /app && python -c 'import app' && gunicorn -b 0.0.0.0:5000 app:app"]
# CMD ["gunicorn", "-b", "0.0.0.0:5000", "--timeout", "60", "--keep-alive", "10", "app:app"]
