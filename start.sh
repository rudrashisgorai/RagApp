# start.sh: Setup virtual environment, install dependencies, and start Streamlit server
#!/usr/bin/env bash

# 1. Create venv if it doesn't exist
echo "Welcome to the start script."
if [ ! -d venvi ]; then
  python3 -m venv venvi
  echo "Created virtual environment in ./venv"
fi

# 2. Activate venv
source venvi/bin/activate

# 3. Upgrade pip and install requirements
pip install --upgrade pip
pip install --no-cache-dir -r requirements.txt
pip install -U langchain langchain-community
pip install streamlit
pip install pdfplumber
pip install semantic-chunkers
pip install open-text-embeddings
pip install faiss
pip install ollama
pip install prompt-template
pip install langchain
pip install langchain_experimental
pip install sentence-transformers
pip install faiss-cpu


echo "Dependencies installed."

# 4. Start Streamlit in background and record its PID
nohup streamlit run app.py --server.port 8501 --server.address 0.0.0.0 \
  > streamlit.log 2>&1 &

echo $! > streamlit.pid
echo "Streamlit server started (PID $(cat streamlit.pid)). Logs: streamlit.log"


