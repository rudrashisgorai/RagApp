
# stop.sh: Tear down the Streamlit server and deactivate
#!/usr/bin/env bash

if [ -f streamlit.pid ]; then
  PID=$(cat streamlit.pid)
  kill $PID && echo "Stopped Streamlit server (PID $PID)"
  rm streamlit.pid
else
  echo "No running server found (no streamlit.pid file)."
fi

# Deactivate virtual environment
if [ -n "$VIRTUAL_ENV" ]; then
  deactivate
  echo "Deactivated virtual environment."
fi
