#!/usr/bin/env bash

# define filename and save path
FILENAME="$(date +'%Y-%m-%d-%H%M%S_screenshotcmd.png')"
SAVEDIR=${XDG_PICTURES_DIR}/screenshots

# make the save path, if it doesn't exist
mkdir -p "$SAVEDIR"

# define the full path for the script to save to
SAVE_FULLPATH="$SAVEDIR/$FILENAME"

# run screenshot command — bail out if maim fails or produces no output
if ! maim -s > /tmp/screenshot_$$.png || [ ! -s /tmp/screenshot_$$.png ]; then
    rm -f /tmp/screenshot_$$.png
    exit 0
fi

# copy to clipboard and save to disk
xclip -selection clipboard -t image/png < /tmp/screenshot_$$.png
mv /tmp/screenshot_$$.png "$SAVE_FULLPATH"

# send notification that copy occurred
dunstify -t 4000 -i "$SAVE_FULLPATH" "Screenshot saved: $FILENAME"
