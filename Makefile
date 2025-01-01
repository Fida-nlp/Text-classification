# Variables
PYTHON = python3
VENV = .venv
REQS = requirements.txt

# Create virtual environment
.PHONY: venv
venv:
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV)
	@echo "Virtual environment created. Run 'source $(VENV)/bin/activate' to activate."

# Install dependencies
.PHONY: install
install: venv
	@echo "Installing dependencies..."
	$(VENV)/bin/pip install -r $(REQS)

# Run unit tests
.PHONY: test
test:
	@echo "Running tests..."
	$(VENV)/bin/python -m pytest tests/

# Train Logistic Regression model
.PHONY: train-lr
train-lr:
	@echo "Training Logistic Regression model..."
	$(VENV)/bin/python models/logistic_regression/LR.py

# Run main application
.PHONY: run
run:
	@echo "Running main application..."
	$(VENV)/bin/python src/main.py

# Clean generated files
.PHONY: clean
clean:
	@echo "Cleaning up temporary files..."
	find . -type d -name '__pycache__' -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete
	find . -type f -name '*.pkl' -delete
	find . -type f -name '*.ipynb_checkpoints' -delete
