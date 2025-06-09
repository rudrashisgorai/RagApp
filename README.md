# RAG System Streamlit App

This project provides a simple RAG (Retrieval-Augmented Generation) demo using DeepSeek R1 & Ollama, built on Streamlit. Use the provided scripts to manage your virtual environment and server.

## Prerequisites

- Python 3.10+
- `git` (optional, to clone this repo)
- `ollama` CLI installed & `ollama serve` running on your host (for the LLM backend)

## Files

- **start.sh** — sets up a Python virtual environment, installs dependencies, and launches Streamlit in the background.
- **stop.sh** — stops the Streamlit server and cleans up.

---

## Usage

1. **Make scripts executable**  
   ```bash
   chmod +x start.sh stop.sh
   ```

2. **Start the app**  
   ```bash
   ./start.sh
   ```
   - Creates or reuses `venv/`
   - Installs from `requirements.txt` and RAG-related packages
   - Runs `streamlit run app.py` on port 8501 in the background
   - Logs to `streamlit.log`, PID stored in `streamlit.pid`

3. **View logs**  
   ```bash
   tail -f streamlit.log
   ```

4. **Stop the app**  
   ```bash
   ./stop.sh
   ```
   - Reads `streamlit.pid` and kills the process
   - Removes the PID file
   - Deactivates the virtual environment

---

## Notes

- Make sure your Ollama server is running (`ollama serve`) before starting the app.  
- The app listens on `0.0.0.0:8501`, so visit [http://localhost:8501](http://localhost:8501) in your browser.  
- Adjust `requirements.txt` or the scripts if you add or remove dependencies.  
