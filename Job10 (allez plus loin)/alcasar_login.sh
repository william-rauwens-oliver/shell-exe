#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 email password"
    exit 1
fi

login_url="https://alcasar.laplateforme.io/intercept.php?res=notyet&uamip=10.10.0.1&uamport=3990&challenge=c020e20c0045"
email="$1"
password="$2"

curl -d "email=$email&password=$password" -X POST "$login_url" --cookie-jar cookies.txt --cookie cookies.txt > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Connexion à Alcasar réussie."
else
    echo "Échec de la connexion à Alcasar."
fi
