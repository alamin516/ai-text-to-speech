RUN --mount=type=cache,id=s/b55f9626-f121-481a-908b-6d86c6abce22-/root/cache/pip,target=/root/.cache/pip python -m venv --copies /opt/venv && . /opt/venv/bin/activate && pip install -r requirements.txt




RUN python -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt
