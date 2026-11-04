#!/bin/bash

OF=$1

DATE=$(date +%Y%m%d_%H%M%S)

ffmpeg -vaapi_device /dev/dri/renderD128 -f v4l2 \
  -framerate 60 -video_size 2560x1440 -i /dev/video0 \
  -f pulse -ac 4 -i "alsa_input.usb-Elgato_Elgato_4K_S_AC8KB53616Q4EY-02.pro-input-0" \
  -vf "format=nv12,hwupload" -c:v hevc_vaapi \
  -rc_mode CQP -global_quality 20 \
  -c:a aac -b:a 192k Videos/raw/${OF}_${DATE}.mkv
