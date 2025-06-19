# 🛠️ Script de Maintenance Ubuntu

Un petit script bash pour maintenir à jour un système Ubuntu : il met à jour les paquets, les met à niveau, nettoie les anciens fichiers, et vérifie si un redémarrage est requis.

## ✨ Fonctionnalités

- `sudo apt update`  
- `sudo apt upgrade -y`  
- `sudo apt autoremove -y`  
- `sudo apt autoclean`  
- Vérifie si un redémarrage est requis (`/var/run/reboot-required`)
- Journalisation dans un fichier `maintenance.log`

## 📥 Installation

1. Télécharge le script :

```bash
wget https://raw.githubusercontent.com/lolo1580/Linux-update/main/maintenance.sh
chmod +x maintenance.sh
```

2. Exécute-le en tant que superutilisateur :

```bash
sudo ./maintenance.sh
```

## 📁 Emplacement du log

Par défaut, les logs sont écrits dans :

```
/var/log/maintenance.log
```

Si tu veux que le log soit dans le dossier de l'utilisateur (sans sudo), modifie cette ligne dans le script :

```bash
LOGFILE="$HOME/maintenance.log"
```

## 🔁 Exemple d’exécution automatique avec `cron`

Tu peux automatiser la maintenance toutes les semaines (dimanche à 3h du matin) :

```bash
sudo crontab -e
```

Ajoute cette ligne :

```cron
0 3 * * 0 /chemin/vers/maintenance.sh
```

## ✅ Exemple de sortie

```bash
===== Maintenance du 2025-06-17 01:30:39 =====
🔄 Mise à jour de la liste des paquets...
⬆️ Mise à niveau des paquets...
🧹 Suppression des paquets inutilisés...
🧼 Nettoyage du cache obsolète...
✅ Aucun redémarrage requis.
✅ Maintenance terminée.
```

## 📜 Licence

Ce script est fourni sans garantie. Utilise-le à tes propres risques.

---

**Auteur** : [TonNom ou ton GitHub]  
**Version** : 1.0
