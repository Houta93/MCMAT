#!/bin/bash

# Script d'automatisation pour les commits GitHub
# Ce script facilite la gestion des modifications par chapitre

# Vérifier si un chapitre a été spécifié
if [ -z "$1" ]; then
  echo "Usage: ./commit_chapitre.sh [numéro_chapitre] [message_commit]"
  echo "Exemple: ./commit_chapitre.sh 03 'Mise à jour des spécifications techniques'"
  exit 1
fi

# Vérifier si un message de commit a été spécifié
if [ -z "$2" ]; then
  echo "Erreur: Veuillez spécifier un message de commit"
  echo "Usage: ./commit_chapitre.sh [numéro_chapitre] [message_commit]"
  exit 1
fi

# Extraire les paramètres
CHAPITRE_NUM=$1
COMMIT_MSG=$2

# Déterminer le nom de la branche
BRANCH_NAME="chapitre-${CHAPITRE_NUM}"

# Vérifier si la branche existe
if ! git show-ref --verify --quiet refs/heads/${BRANCH_NAME}; then
  echo "Erreur: La branche ${BRANCH_NAME} n'existe pas"
  echo "Branches disponibles:"
  git branch | grep "chapitre-"
  exit 1
fi

# Basculer vers la branche du chapitre
echo "Basculement vers la branche ${BRANCH_NAME}..."
git checkout ${BRANCH_NAME}

# Ajouter les modifications
echo "Ajout des modifications pour le chapitre ${CHAPITRE_NUM}..."
git add chapitres/${CHAPITRE_NUM}*

# Créer le commit
echo "Création du commit avec le message: '${COMMIT_MSG}'..."
git commit -m "[Chapitre ${CHAPITRE_NUM}] ${COMMIT_MSG}"

# Pousser les modifications vers GitHub
echo "Envoi des modifications vers GitHub..."
git push origin ${BRANCH_NAME}

echo "Modifications du chapitre ${CHAPITRE_NUM} enregistrées et envoyées avec succès!"
echo "Branche: ${BRANCH_NAME}"
echo "Message: ${COMMIT_MSG}"
