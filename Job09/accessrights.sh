#!/bin/bash

csv_file="/mnt/c/Users/gamer/Downloads/Script/shell/Job09/Shell_Userlist.csv"

create_user_and_assign_permissions() {
    local id="$1"
    local prenom="$2"
    local nom="$3"
    local mdp="$4"
    local role="$5"

    if id "$prenom" &>/dev/null; then
        echo "L'utilisateur $prenom existe déjà."
    else
        sudo useradd -m -p "$(echo "$mdp" | openssl passwd -1 -stdin)" -c "$prenom $nom" "$prenom"

        if [ "$role" == "Admin" ]; then
            sudo usermod -aG sudo "$prenom"

            sudo groupadd -f superutilisateur

            sudo usermod -aG superutilisateur "$prenom"

            echo "$prenom a été mis à jour en super utilisateur et ajouté au groupe sudo."
        else
            echo "$prenom ne sera pas mis à jour en super utilisateur."
        fi
    fi
}

cat "$csv_file" | column -t -s ","

tail -n +2 "$csv_file" | while IFS=',' read -r id prenom nom mdp role; do
    echo "Lecture : id=$id, prenom=$prenom, nom=$nom, mdp=$mdp, role=$role"
    create_user_and_assign_permissions "$id" "$prenom" "$nom" "$mdp" "$role"
    echo "Fin de la création de l'utilisateur $prenom"
done

echo "Utilisateurs du groupe superutilisateur :"
getent group superutilisateur | cut -d ':' -f 4 | tr ',' ' '
