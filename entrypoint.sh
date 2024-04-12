#!/bin/bash

if [ "x$1" == "xbash" ]; then
    exec bash
elif [ "x$1" == "xyt_summary" ]; then
    if [ "x$2" == "x" ]; then
	echo "A youtube url video should be provided"
        exit 3
    fi
    exec youtube_transcript_api $2 | fabric --pattern extract_wisdom
else
    fabric-webui
fi
