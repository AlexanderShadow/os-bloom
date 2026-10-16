FROM python:3.12-slim
WORKDIR /app
COPY collector/pyproject.toml collector/pyproject.toml
COPY collector/src collector/src
COPY ui ui
COPY config.yaml config.yaml
RUN pip install --no-cache-dir -e ./collector
ENV CONFIG_PATH=/app/config.yaml \
    DB_PATH=/data/bloom.db \
    SERVE_UI=1
EXPOSE 8000
CMD ["python", "-m", "collector.main"]
