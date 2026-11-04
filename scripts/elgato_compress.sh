#!/bin/bash

ffmpeg -i Videos/OBS/breathofthewild3.mkv -c:v libsvtav1 -crf 26 -preset 4 -pix_fmt yuv420p10le -c:a libopus -b:a 128k Videos/OBS/compressed_breathofthewild3.mkv
