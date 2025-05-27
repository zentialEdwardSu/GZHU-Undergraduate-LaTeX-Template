#!/bin/bash

MONTH=$(date +%m)
DAY=$(date +%d)

MONTH=$(echo $MONTH | sed 's/^0//')
DAY=$(echo $DAY | sed 's/^0//')

MAX_VERSION=0
for file in main_${MONTH}_${DAY}_*.pdf; do
    if [ -f "$file" ]; then
        VERSION=$(echo $file | sed -E "s/main_${MONTH}_${DAY}_([0-9]+)\.pdf/\1/")
        if [ "$VERSION" -gt "$MAX_VERSION" ]; then
            MAX_VERSION=$VERSION
        fi
    fi
done

NEW_VERSION=$((MAX_VERSION + 1))
BACKUP_CREATED=false

if [ $MAX_VERSION -eq 0 ]; then
    if [ -f "main.pdf" ]; then
        cp main.pdf "main_${MONTH}_${DAY}_1.pdf"
        echo "Created main_${MONTH}_${DAY}_1.pdf"
        BACKUP_CREATED=true
        NEW_VERSION=1
    else
        echo "main.pdf not found, cannot create backup"
    fi
else
    if [ -f "main.pdf" ]; then
        cp main.pdf "main_${MONTH}_${DAY}_${NEW_VERSION}.pdf"
        echo "Created main_${MONTH}_${DAY}_${NEW_VERSION}.pdf"
        BACKUP_CREATED=true
    else
        echo "main.pdf not found, cannot create backup"
    fi
fi

if [ "$BACKUP_CREATED" = true ]; then
    echo "Action on git"
    
    if [ ! -d ".git" ]; then
        echo "No git repo found"
        exit -1
    fi
    
    git add main.tex references.bib gzhubenke.sty assets/
    
    COMMIT_MESSAGE="${MONTH}-${DAY}-V${NEW_VERSION}"
    git commit -s -m  "$COMMIT_MESSAGE"
    
    echo "Commited: $COMMIT_MESSAGE"
else
    echo "failed to create backup, no files added to git"
fi