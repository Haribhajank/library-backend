# 1. Start with the slim image
FROM python:3.12-slim

# 2. Settings
ENV PYTHONUNBUFFERED=1

# 3. Set work directory
WORKDIR /app

# --- NEW STEP: Install System Dependencies ---
# We update the package list, install the compiler (gcc) and postgres headers (libpq-dev),
# and then clean up the cache to keep the image small.
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 4. Copy requirements
COPY requirements.txt /app/

# 5. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copy code
COPY . /app/

# 7. Run command
CMD ["gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000"]