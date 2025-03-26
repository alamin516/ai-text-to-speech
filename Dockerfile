RUN --mount=type=cache,id=s/... python -m venv --copies /opt/venv && . /opt/venv/bin/activate && pip install -r requirements.txt

RUN python -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt
