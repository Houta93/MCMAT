#!/bin/bash

# Script d'automatisation pour les commits GitHub
# Ce script facilite la gestion des modifications par chapitre
# Version mise à jour pour la nouvelle structure des dossiers

# Vérifier si un chapitre a été spécifié
if [ -z "$1" ]; then
  echo "Usage: ./commit_chapitre.sh [dossier_chapitre] [message_commit]"
  echo "Exemple: ./commit_chapitre.sh 03_relations_algero_turques 'Ajout des accords commerciaux'"
  echo ""
  echo "Chapitres disponibles:"
  ls -d chapitres/[0-9]*
  exit 1
fi

# Vérifier si un message de commit a été spécifié
if [ -z "$2" ]; then
  echo "Erreur: Veuillez spécifier un message de commit"
  echo "Usage: ./commit_chapitre.sh [dossier_chapitre] [message_commit]"
  exit 1
fi

# Extraire les paramètres
CHAPITRE_DIR=$1
COMMIT_MSG=$2

# Extraire le numéro du chapitre
CHAPITRE_NUM=$(echo $CHAPITRE_DIR | cut -d'_' -f1)

# Vérifier si le dossier du chapitre existe
if [ ! -d "chapitres/${CHAPITRE_DIR}" ]; then
  echo "Erreur: Le dossier chapitres/${CHAPITRE_DIR} n'existe pas"
  echo "Chapitres disponibles:"
  ls -d chapitres/[0-9]*
  exit 1
fi

# Déterminer le nom de la branche
BRANCH_NAME="chapitre-${CHAPITRE_NUM}"

# Vérifier si la branche existe, sinon la créer
if ! git show-ref --verify --quiet refs/heads/${BRANCH_NAME}; then
  echo "La branche ${BRANCH_NAME} n'existe pas, création en cours..."
  git checkout -b ${BRANCH_NAME}
else
  # Basculer vers la branche du chapitre
  echo "Basculement vers la branche ${BRANCH_NAME}..."
  git checkout ${BRANCH_NAME}
fi

# Ajouter les modifications
echo "Ajout des modifications pour le chapitre ${CHAPITRE_DIR}..."
git add chapitres/${CHAPITRE_DIR}

# Ajouter également les fichiers de références dans l'annexe E
echo "Ajout des fichiers de références..."
git add chapitres/annexes/annexe_e_sources/references_chapitre_${CHAPITRE_NUM}.md

# Si le chapitre est dans un sous-dossier (comme pour les marchés)
if [[ $CHAPITRE_DIR == *"/"* ]]; then
  # Traiter les sous-dossiers
  PARENT_DIR=$(echo $CHAPITRE_DIR | cut -d'/' -f1)
  git add chapitres/${PARENT_DIR}
fi

# Mettre à jour le fichier de suivi d'avancement
echo "Mise à jour du fichier de suivi d'avancement..."
DATE_MODIF=$(date +"%d/%m/%Y")
CHAPITRE_NOM=$(echo $CHAPITRE_DIR | cut -d'_' -f2- | tr '_' ' ' | sed 's/^./\U&/g')

# Vérifier si le chapitre est déjà dans le fichier de suivi
if grep -q "| ${CHAPITRE_NUM} | ${CHAPITRE_NOM}" SUIVI_AVANCEMENT.md; then
  # Mettre à jour la ligne existante
  sed -i "/| ${CHAPITRE_NUM} | ${CHAPITRE_NOM}/s/| [0-9]\{1,3\}% |/| 50% |/" SUIVI_AVANCEMENT.md
  sed -i "/| ${CHAPITRE_NUM} | ${CHAPITRE_NOM}/s/| [0-9]\{2\}\/[0-9]\{2\}\/[0-9]\{4\} |/| ${DATE_MODIF} |/" SUIVI_AVANCEMENT.md
  sed -i "/| ${CHAPITRE_NUM} | ${CHAPITRE_NOM}/s/| Non commencé |/| En cours |/" SUIVI_AVANCEMENT.md
else
  # Ajouter une nouvelle ligne
  echo "| ${CHAPITRE_NUM} | ${CHAPITRE_NOM} | En cours | 50% | ${DATE_MODIF} |" >> SUIVI_AVANCEMENT.md
fi

# Ajouter le fichier de suivi aux modifications
git add SUIVI_AVANCEMENT.md

# Créer le commit
echo "Création du commit avec le message: '${COMMIT_MSG}'..."
git commit -m "[Chapitre ${CHAPITRE_NUM}] ${COMMIT_MSG}"

# Pousser les modifications vers GitHub
echo "Envoi des modifications vers GitHub..."
git push origin ${BRANCH_NAME}

echo "Modifications du chapitre ${CHAPITRE_DIR} enregistrées et envoyées avec succès!"
echo "Branche: ${BRANCH_NAME}"
echo "Message: ${COMMIT_MSG}"
echo "Fichier de suivi d'avancement mis à jour."

# Retour à la branche principale
git checkout main
echo "Retour à la branche principale (main)"
