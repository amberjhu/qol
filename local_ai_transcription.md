https://localai.io/features/audio-to-text/

Start up the local server

```
docker run -ti --name local-ai -p 8080:8080 localai/localai:latest
```

Check that the model you want (e.g., whisper-1) is installed by going to http://localhost:8080/ in your browser, assuming you're
running this locally, not through SSH. Which... you should be. That's the whole point of local audio transcription.

Navigate to the directory with your audio file and run the following, replacing INPUT_FILE and OUTPUT_FILE.

```
INPUT_FILE=blah.m4a
OUTPUT_FILE=blah.txt
curl http://localhost:8080/v1/audio/transcriptions -F file="@$PWD/$INPUT_FILE" -F model="whisper-1" -F response_format="srt" | tee $OUTPUT_FILE
```

