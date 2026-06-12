FROM python:3.11-slim
 
WORKDIR /app
 
# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
 
# Copy application code
COPY . .
 
# Default port(7860 for Hugging Face Spaces)
EXPOSE 7860
 
# Run the Streamlit app; bind to 0.0.0.0, reachable from outside the container
CMD ["streamlit", "run", "codes/streamlit_ui.py", \
     "--server.port=7860", \
     "--server.address=0.0.0.0"]