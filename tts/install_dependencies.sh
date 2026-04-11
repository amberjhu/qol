#!/bin/bash
# Install espeak-ng if you don't already have it
apt list | grep 'espeak-ng' || sudo apt-get install -y espeak-ngV
# Create a Python virtual environment
python -m venv .venv
. .venv/bin/activate
# Install Python dependencies
pip install kokoro soundfile
