## Dockerfile for Streamlit RAG Application

# Use official Python runtime
FROM python:3.10.1-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt and install base dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Install RAG system prerequisites
RUN pip install --no-cache-dir \
    langchain langchain-community \
    streamlit \
    pdfplumber \
    semantic-chunkers \
    open-text-embeddings \
    faiss-cpu \
    ollama \
    prompt-template \
    langchain_experimental \
    sentence-transformers
    
# Copy the rest of the application code
COPY . .

# Expose Streamlit default port
EXPOSE 8501

# Run the Streamlit application
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port", "8501", "--server.address", "0.0.0.0"]
