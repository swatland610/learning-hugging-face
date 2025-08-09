# ------- config -------
PYTHON ?= python3
VENV   ?= .venv
PIP    := $(VENV)/bin/pip
PY     := $(VENV)/bin/python

# Default target lists available commands
.PHONY: help
help:
	@echo "Make targets:"
	@echo "  make venv           Create virtualenv"
	@echo "  make install        Install requirements (CPU Torch by default)"
	@echo "  make install-cuda   Install Torch with CUDA wheels (edit CUDA version as needed)"
	@echo "  make lab            Launch JupyterLab"
	@echo "  make test           Quick import + device sanity check"
	@echo "  make freeze         Write exact versions to requirements.lock"
	@echo "  make clean          Remove venv and caches"

# ------- env setup -------
$(VENV)/bin/activate:
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip
	touch $(VENV)/bin/activate

.PHONY: venv
venv: $(VENV)/bin/activate

# ------- install -------
.PHONY: install
install: venv
	$(PIP) install -r requirements.txt

# If you have an NVIDIA GPU + CUDA drivers installed, use this once instead of `make install`.
# Adjust cu121 -> your CUDA version (e.g., cu118, cu121).
.PHONY: install-cuda
install-cuda: venv
	$(PIP) install --index-url https://download.pytorch.org/whl/cu121 torch
	$(PIP) install -r requirements.txt

# ------- dev helpers -------
.PHONY: lab
lab: venv
	$(VENV)/bin/jupyter lab

.PHONY: test
test: venv
	$(PY) scripts/test_env.py

.PHONY: freeze
freeze: venv
	$(PIP) freeze > requirements.lock
	@echo "Pinned exact versions to requirements.lock"

.PHONY: clean
clean:
	rm -rf $(VENV) __pycache__ .pytest_cache .ipynb_checkpoints
	find . -name "*.pyc" -delete
