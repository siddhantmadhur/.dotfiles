#!/bin/bash

pactl load-module module-loopback \
  source=alsa_input.usb-Elgato_Elgato_4K_S_AC8KB53616Q4EY-02.pro-input-0 \
  latency_msec=50
