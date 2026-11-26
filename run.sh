#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# Codespaces can open with a newer system Python. Use the model's runtime.
if command -v python3.12 >/dev/null 2>&1; then
    if [[ ! -x .venv-312/bin/python ]]; then
        python3.12 -m venv .venv-312
    fi
    .venv-312/bin/python -m pip install --disable-pip-version-check -r requirements.txt
    exec .venv-312/bin/python -m streamlit run app.py --server.port=8501 "$@"
fi

if command -v uv >/dev/null 2>&1; then
    runner=uv
else
    if [[ ! -x .launch-tools/bin/uv ]]; then
        python3 -m venv .launch-tools
        .launch-tools/bin/python -m pip install uv
    fi
    runner=.launch-tools/bin/uv
fi
exec "$runner" run --no-project --isolated --python 3.12 --with-requirements requirements.txt \
    python -m streamlit run app.py --server.port=8501 "$@"
