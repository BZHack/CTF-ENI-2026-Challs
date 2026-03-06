#!/bin/bash
set -e

FLAG="ENI{C4ch3_mai5_TOuJ0uRs_Pr35eNT_A_qu1_saIT_VoiR}"

mkdir -p /var/www/html/archives
cd /var/www/html/archives

rand_suffix() {
  tr -dc 'A-Za-z0-9' </dev/urandom | head -c8
}

# Rapport le plus ancien, 13 mois en arrière, version 0.9 contenant le flag
OLDEST_DAY=$(date -d "13 months ago" +%Y%m01)
OLDEST_HUMAN=$(date -d "$OLDEST_DAY" +%Y-%m-%d)
OLDEST_SUFFIX=$(rand_suffix)
OLDEST_FILE="maintenance-${OLDEST_DAY}-${OLDEST_SUFFIX}.log"
HOUR_RUN="04:45"

cat > "$OLDEST_FILE" <<EOF
=== Rapport mensuel de maintenance (v1.2) ===
Date : ${OLDEST_HUMAN} ${HOUR_RUN}:00 UTC
Serveur : srv-app-01
Maintenance-ID : MNT-${OLDEST_DAY}-${OLDEST_SUFFIX}

Tâches effectuées :
  - Vérification des services système
  - Nettoyage des journaux
  - Contrôle des fichiers de configuration
  - Validation des permissions critiques

Bloc d'intégrité :
  Checksum : $(openssl rand -hex 16 | sha256sum | awk '{print $1}')

Debug-Key :
  - ${FLAG}

Resume :
  Rapport mensuel généré automatiquement.
EOF

touch -t "$(date -d "$OLDEST_DAY ${HOUR_RUN}" +%Y%m%d%H%M)" "$OLDEST_FILE"

# 12 rapports mensuels récents, version corrigée 1.3
for i in $(seq 12 -1 1); do
  DAY=$(date -d "$i months ago" +%Y%m01)
  HUMAN_DATE=$(date -d "$DAY" +%Y-%m-%d)
  SUFFIX=$(rand_suffix)
  FILE="maintenance-${DAY}-${SUFFIX}.log"

  cat > "$FILE" <<EOF
=== Rapport mensuel de maintenance (v1.3) ===
Date : ${HUMAN_DATE} ${HOUR_RUN}:00 UTC
Serveur : srv-app-01
Maintenance-ID : MNT-${OLDEST_DAY}-${OLDEST_SUFFIX}

Tâches effectuées :
  - Vérification des services système
  - Nettoyage des journaux
  - Contrôle des fichiers de configuration
  - Validation des permissions critiques

Bloc d'intégrité :
  Checksum : $(openssl rand -hex 16 | sha256sum | awk '{print $1}')

Resume :
  Rapport mensuel généré automatiquement.
  Correctif de sécurité : Le champ 'Debug-Key' n'est plus utilisé.
EOF

  touch -t "$(date -d "$DAY ${HOUR_RUN}" +%Y%m%d%H%M)" "$FILE"
done

chown -R www-data:www-data /var/www/html/archives
chmod -R 644 /var/www/html/archives/*.log || true

exec "$@"
