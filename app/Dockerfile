FROM python:alpine3.17
RUN apk update && apk add --no-cache gcc=12.2.1_git20220924-r4 musl-dev=1.2.3-r4 mariadb-dev=10.6.12-r0
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["gunicorn", "-b", "0.0.0.0:3000", "app:application"]