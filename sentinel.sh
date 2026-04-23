#!/bin/bash
echo "———Welcome to the Sentinel———"
echo "please specify your next action"
echo "1- login 2- register "

while true; do
    read -p ">" choice
    if [[ $choice == "1" ]]; then
        echo "type your password and name"
        read -s -p "Enter the pass:   " passy
        read -p "Etner the name   " namy
        hashed=$(echo -n "$passy" | sha256sum)
        stored=$(grep "$hashed" .sentinel_users)
        if [[ "$passy" == "$stored" ]]; then
            echo "welcome"
        fi

        
    elif [[ "$choice" == "2" ]]; then
            echo "oh please sire enter your name followed by your password of choice"
            read -p "Enter the name:   " name
            read -p "Enter the pass:   " -s pass
            myhash=$(echo -n "$pass" | sha256sum)
            echo "$name:$myhash" >> .sentinel_users
    else
        break

    fi
done