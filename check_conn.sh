#!/usr/bin/env bash

# ==============================
# CONFIGURATION
# ==============================
LOGIN_SCRIPT="/home/teto/pfsense-login.sh"   # chemin du script de connexion
TEST_URL="http://google.com"                 # ou 8.8.8.8 en HTTP
LOG_FILE="/var/log/pfsense-login.log"        # fichier de log
# ==============================

# Test de connexion (HTTP, pas ping, car le ping passe même en captive)
HTTP_CODE=$(curl -I -s --max-time 5 "$TEST_URL" | head -n 1 | awk '{print $2}')

# Si la réponse n'est pas 200 = captive portal / pas d'accès net
if [ "$HTTP_CODE" != "200" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') : Accès bloqué → Exécution du script login." >> "$LOG_FILE"
    bash "$LOGIN_SCRIPT"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') : Connexion OK." >> "$LOG_FILE"
fi
