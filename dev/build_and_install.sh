#! /bin/bash
if test -z "$VIRTUAL_ENV"; then
	# next line assumes user created virtual environment in directory .venv
	source .venv/bin/activate
fi
python3 -m build
#once:
python3 -m pip install --require-virtualenv -r config/dev-requirements.txt
# get output name X dist/*whl
X=$(ls -1tr dist/*.whl |tail -n 1)
python3 -m pip install --require-virtualenv --force-reinstall --no-deps $X
python3 -m pytest


.venv/bin/test_adctk_builder

