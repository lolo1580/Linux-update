#!/bin/bash

LOGFILE="/var/log/maintenance.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "===== Maintenance du $TIMESTAMP =====" | tee -a "$LOGFILE"

echo "🔄 Mise à jour de la liste des paquets..." | tee -a "$LOGFILE"
sudo apt update | tee -a "$LOGFILE"

echo "⬆️ Mise à niveau des paquets..." | tee -a "$LOGFILE"
sudo apt upgrade -y | tee -a "$LOGFILE"

echo "🧹 Suppression des paquets inutilisés..." | tee -a "$LOGFILE"
sudo apt autoremove -y | tee -a "$LOGFILE"

echo "🧼 Nettoyage du cache obsolète..." | tee -a "$LOGFILE"
sudo apt autoclean | tee -a "$LOGFILE"

# Vérification du redémarrage requis
if [ -f /var/run/reboot-required ]; then
    echo "⚠️ Redémarrage requis après cette mise à jour." | tee -a "$LOGFILE"
else
    echo "✅ Aucun redémarrage requis." | tee -a "$LOGFILE"
fi

echo "✅ Maintenance terminée." | tee -a "$LOGFILE"
echo "" | tee -a "$LOGFILE"
