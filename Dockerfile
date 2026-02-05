FROM python:3.12-slim AS base

# Install uv for dependency management
RUN pip install --upgrade pip && pip install uv

WORKDIR /app
ENV UV_LINK_MODE=copy

# Copy project metadata first for efficient caching
COPY pyproject.toml README.md ./ 

# Create the virtual environment and install dependencies (none yet, but keeps layer ready)
RUN uv sync --no-dev || true

# Copy the rest of the code (placeholder at this stage)
COPY . .

# Activate the virtual environment for runtime
ENV PATH="/app/.venv/bin:${PATH}"

# Default command: drop into a Python REPL via uv-run
CMD ["uv", "run", "python"]
