# shell-ex

lorsqu'on éxécute la commande des jobs comme le 7,8 et 9, cela crée un dossier dans le lecteur linux et non dans notre ordinateur windows !

Pour le job 8 et le job 9, il faudra utiliser crontab, voici les étapes suivantes :

crontab -e (pour permettre de lancer crontab pour le job 8 et 9)

pour le 8 il faut écrire la commande : "*/30 * * * * /mnt/c/Users/gamer/Downloads/Script/shell/Job08/get_logs.sh"

pour le job 9 il faur écrire la commande : "* * * * * /mnt/c/Users/gamer/Downloads/Script/shell/Job09/accessrights.sh"
