FROM python:alpine3.17
RUN apk update && apk add --no-cache gcc musl-dev mariadb-dev
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["gunicorn", "-b", "0.0.0.0:3000", "app:application"]