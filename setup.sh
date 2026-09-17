#!/bin/zsh
# AGPL-3.0-or-later

# Default Profile Name
PROFILE_NAME=PriceAnalysis

# Set the path - user should edit this!
FIREFOX=$(which iceweasel)

# Create an FF profile
$FIREFOX -CreateProfile $PROFILE_NAME
