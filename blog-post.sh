#! /bin/bash

HUGODATE=$(date --iso-8601=seconds)
USERNAME=$(whoami)

# Stolen from https://stackoverflow.com/questions/833227/whats-the-easiest-way-to-get-a-users-full-name-on-a-linux-posix-system
USER_RECORD="$(getent passwd $USERNAME)"
USER_GECOS_FIELD="$(echo "$USER_RECORD" | cut -d ':' -f 5)"

echo "Please insert the blog posts title and press ENTER."
read -r TITLEINPUT
TITLE=${TITLEINPUT,,}	# To lower case
TITLE=${TITLE//ä/ae}
TITLE=${TITLE//ö/oe}
TITLE=${TITLE//ü/ue}
TITLE=${TITLE//ß/ss}
TITLE=${TITLE//\ -\ /\ }	# Replace " - " with space
TITLE=${TITLE//[@-.:,;?!\/]/}	# Remove special characters
TITLE=${TITLE//\ /-} 	# Replace spaces with -

cat > ./content/post/"$TITLE".md << EOF
---
title: "$TITLEINPUT"
date: $HUGODATE
authors:
  - $USERNAME
---

EOF

$EDITOR ./content/post/"$TITLE".md
