# Usa uma imagem oficial do Python, versão leve
FROM python:3.11-slim

WORKDIR /app

# Copia os requisitos e instala as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código
COPY . .

# Expõe a porta que o Gunicorn vai usar
EXPOSE 8002

# Comando de inicialização indicado no seu README
CMD ["gunicorn", "--bind", "0.0.0.0:8002", "app:app"]