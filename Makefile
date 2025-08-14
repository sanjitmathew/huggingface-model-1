install:
	pip install --upgrade pip && \
	pip uninstall -y keras && \
	pip install tf-keras && \
	pip install "tensorflow>=2.18.0" && \
	pip install "gradio==5.33.2" transformers && \
	pip install -r requirements.txt

test:
	python -m pytest -vvv --cov=hello --cov=greeting \
		--cov=smath --cov=web tests && \
	python -m pytest --nbval notebook.ipynb  # tests our Jupyter notebook
	# python -m pytest -v tests/test_web.py  # if you just want to test web

debug:
	python -m pytest -vv --pdb  # Debugger is invoked

one-test:
	python -m pytest -vv tests/test_greeting.py::test_my_name4

debugthree:
	# This drops to PDB on the first 4 failures
	python -m pytest -vv --pdb --maxfail=4

format:
	black *.py

lint:
	pylint --disable=R,C *.py

all: install lint test format
