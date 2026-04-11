# Copyright 2026 Amber Hu
# python -m venv .venv
# source .venv/bin/activate
# pip install kokoro soundfile
# sudo apt-get install espeak-ng
from kokoro import KPipeline
import soundfile as sf
import torch
import sys
import numpy as np
pipeline = KPipeline(lang_code='a')
print("Loaded kokoro model.")
print("Enter all the text you want to TTS and then enter a newline and hit Ctrl+D to close the input stream")
text='Warming up audio decoder, please wait a few seconds... '
for line in sys.stdin:
    text += line
print("Input finished. Generating audio...")
audio_segments = []
generator = pipeline(text, voice='af_heart')
for i, (gs, ps, audio) in enumerate(generator):
    print(f'Segment {i}:', gs, ps)
    audio_segments.append(audio)
    print("Writing audio to", f'output/{i}.mp3')
    sf.write(f'output/{i}.mp3', audio, 24000)

print("Concatenating all audio segments")
full_audio = np.concatenate(audio_segments)
print("Writing full audio file to output/final.mp3")
sf.write('output/final.mp3', full_audio, 24000)

