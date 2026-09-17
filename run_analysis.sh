#!/bin/zsh
# AGPL-3.0-or-later

./prepare_data.sh
octave --persist run_analysis.m
