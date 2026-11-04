#!/bin/bash

OF=$1

DATE=$(date +%Y%m%d_%H%M%S)

ffmpeg -vaapi_device /dev/dri/renderD128 -f v4l2 \
  -framerate 60 -video_size 2560x1440 -i /dev/video0 \
  -f pulse -ac 4 -i "alsa_input.usb-Elgato_Elgato_4K_S_AC8KB53616Q4EY-02.pro-input-0" \
  -f pulse -i "alsa_input.usb-Razer_Inc_Razer_Seiren_Mini_UC2125L03301998-00.mono-fallback" \
  -map 0:v \
  -map 1:a \
  -map 2:a \
  -vf "format=nv12,hwupload" -c:v hevc_vaapi \
  -rc_mode CQP -global_quality 20 \
  -b:a 192k -c:a aac Videos/rawcaptures/${OF}_${DATE}.mkv
