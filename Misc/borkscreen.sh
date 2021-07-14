#!/bin/bash

tmux new -s borkscreen -d
tmux send-keys -t borkscreen 'cd ~/borkscreen; npm run serve' C-m