# Imagen base
FROM python:3.9-slim

# Instala dependencias de sistema necesarias para Playwright, Node.js y los navegadores
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    xz-utils \
    libglib2.0-0 \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libxkbcommon0 \
    libasound2 \
    libxtst6 \
    libxrandr2 \
    libxdamage1 \
    libxcomposite1 \
    libxext6 \
    libxfixes3 \
    libexpat1 \
    libxcb1 \
    libx11-6 \
    libxrender1 \
    libxi6 \
    libcairo2 \
    libpango-1.0-0 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libgbm1 \
    libnspr4 \
    libcairo-gobject2 \
    libasound2 \
    libatspi2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Descargar e instalar Node.js 20.5.0 directamente
RUN curl -fsSL https://nodejs.org/dist/v20.5.0/node-v20.5.0-linux-x64.tar.xz | tar -xJf - -C /usr/local --strip-components=1 --no-same-owner

# Verificar instalación de Node.js y npm
RUN node -v && npm -v

RUN pip install --upgrade pip

# Instala Robot Framework, robotframework-browser y Flask
RUN pip install robotframework robotframework-browser playwright Flask flask-jwt-extended flask-sqlalchemy python-dotenv gunicorn

# Ejecuta `rfbrowser init` para instalar las dependencias necesarias de RF-Browser
RUN rfbrowser init

# Crea directorio de trabajo
WORKDIR /code

# Expone el puerto para Flask
EXPOSE 80

# Comando para ejecutar el servidor de Flask
CMD ["gunicorn", "--bind", "0.0.0.0:80", "--workers", "3", "app:app"]