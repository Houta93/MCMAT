#!/bin/bash

# Script d'automatisation amélioré pour les commits GitHub
# Version 2.0 - Workflow simplifié
# Ce script facilite la gestion des modifications par chapitre
# avec options pour travailler directement sur main ou develop

# Variables de couleur pour améliorer la lisibilité
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Afficher l'aide
show_help() {
  echo -e "${BLUE}Script d'automatisation pour les commits - MCMAT${NC}"
  echo ""
  echo -e "Usage: ${YELLOW}./improved_commit_script.sh [options] [dossier_chapitre] [message_commit]${NC}"
  echo ""
  echo -e "${GREEN}Options:${NC}"
  echo "  -h, --help             Afficher cette aide"
  echo "  -d, --direct           Commit directement sur la branche courante (main ou develop)"
  echo "  -f, --feature          Créer/utiliser une branche feature pour ce chapitre"
  echo "  -m, --main             Après commit, fusionner directement dans main (avec develop)"
  echo ""
  echo -e "${GREEN}Exemples:${NC}"
  echo "  ./improved_commit_script.sh 03_relations_algero_turques 'Ajout des accords commerciaux'"
  echo "  ./improved_commit_script.sh -d 02_contexte_economique 'Mise à jour des statistiques'"
  echo "  ./improved_commit_script.sh -f 04_secteur_materiaux 'Nouveau chapitre sur le secteur'"
  echo ""
  echo -e "${GREEN}Chapitres disponibles:${NC}"
  ls -d chapitres/[0-9]* | sed 's/chapitres\///'
}

# Initialiser les variables
DIRECT_COMMIT=false
CREATE_FEATURE=false
MERGE_TO_MAIN=false

# Traiter les options
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      show_help
      exit 0
      ;;
    -d|--direct)
      DIRECT_COMMIT=true
      shift
      ;;
    -f|--feature)
      CREATE_FEATURE=true
      shift
      ;;
    -m|--main)
      MERGE_TO_MAIN=true
      shift
      ;;
    *)
      # Si ce n'est pas une option, on considère que c'est le dossier du chapitre
      break
      ;;
  esac
done

# Vérifier si un chapitre a été spécifié
if [ -z "$1" ]; then
  echo -e "${RED}Erreur: Aucun chapitre spécifié${NC}"
  show_help
  exit 1
fi

# Vérifier si un message de commit a été spécifié
if [ -z "$2" ]; then
  echo -e "${RED}Erreur: Veuillez spécifier un message de commit${NC}"
  show_help
  exit 1
fi

# Extraire les paramètres
CHAPITRE_DIR=$1
COMMIT_MSG=$2

# Extraire le numéro du chapitre
CHAPITRE_NUM=$(echo $CHAPITRE_DIR | cut -d'_' -f1)

# Vérifier si le dossier du chapitre existe
if [ ! -d "chapitres/${CHAPITRE_DIR}" ]; then
  echo -e "${RED}Erreur: Le dossier chapitres/${CHAPITRE_DIR} n'existe pas${NC}"
  echo -e "${BLUE}Chapitres disponibles:${NC}"
  ls -d chapitres/[0-9]* | sed 's/chapitres\///'
  exit 1
fi

# Déterminer vers quelle branche basculer
if [ "$DIRECT_COMMIT" = true ]; then
  # Rester sur la branche actuelle
  CURRENT_BRANCH=$(git branch --show-current)
  echo -e "${GREEN}Utilisation de la branche actuelle: ${CURRENT_BRANCH}${NC}"
elif [ "$CREATE_FEATURE" = true ]; then
  # Créer ou utiliser une branche feature
  BRANCH_NAME="feature/chapitre-${CHAPITRE_NUM}"
  
  # Vérifier si la branche existe, sinon la créer
  if ! git show-ref --verify --quiet refs/heads/${BRANCH_NAME}; then
    echo -e "${BLUE}La branche ${BRANCH_NAME} n'existe pas, création en cours...${NC}"
    git checkout -b ${BRANCH_NAME}
  else
    # Basculer vers la branche feature
    echo -e "${BLUE}Basculement vers la branche ${BRANCH_NAME}...${NC}"
    git checkout ${BRANCH_NAME}
  fi
else
  # Par défaut, utiliser develop
  echo -e "${BLUE}Basculement vers la branche develop...${NC}"
  git checkout develop
fi

# Ajouter les modifications
echo -e "${GREEN}Ajout des modifications pour le chapitre ${CHAPITRE_DIR}...${NC}"
git add chapitres/${CHAPITRE_DIR}

# Ajouter également les fichiers de références dans l'annexe E
echo -e "${GREEN}Ajout des fichiers de références...${NC}"
git add chapitres/annexes/annexe_e_sources/references_chapitre_${CHAPITRE_NUM}.md

# Si le chapitre est dans un sous-dossier (comme pour les marchés)
if [[ $CHAPITRE_DIR == *"/"* ]]; then
  # Traiter les sous-dossiers
  PARENT_DIR=$(echo $CHAPITRE_DIR | cut -d'/' -f1)
  git add chapitres/${PARENT_DIR}
fi

# Mettre à jour le fichier de suivi d'avancement
echo -e "${GREEN}Mise à jour du fichier de suivi d'avancement...${NC}"
DATE_MODIF=$(date +"%d/%m/%Y")
CHAPITRE_NOM=$(echo $CHAPITRE_DIR | cut -d'_' -f2- | tr '_' ' ' | sed 's/^./\\U&/g')

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
echo -e "${GREEN}Création du commit avec le message: '${COMMIT_MSG}'...${NC}"
git commit -m "[Chapitre ${CHAPITRE_NUM}] ${COMMIT_MSG}"

# Pousser les modifications vers GitHub
echo -e "${GREEN}Envoi des modifications vers GitHub...${NC}"
CURRENT_BRANCH=$(git branch --show-current)
git push origin ${CURRENT_BRANCH}

echo -e "${BLUE}Modifications du chapitre ${CHAPITRE_DIR} enregistrées et envoyées avec succès!${NC}"
echo -e "${BLUE}Branche: ${CURRENT_BRANCH}${NC}"
echo -e "${BLUE}Message: ${COMMIT_MSG}${NC}"
echo -e "${BLUE}Fichier de suivi d'avancement mis à jour.${NC}"

# Si nous sommes sur une branche feature et que nous voulons fusionner
if [ "$CREATE_FEATURE" = true ] && [ "$MERGE_TO_MAIN" = true ]; then
  echo -e "${YELLOW}Fusion de la branche feature dans develop...${NC}"
  git checkout develop
  git merge ${BRANCH_NAME}
  git push origin develop
  
  echo -e "${YELLOW}Fusion de develop dans main...${NC}"
  git checkout main
  git merge develop
  git push origin main
  
  echo -e "${GREEN}Toutes les modifications ont été fusionnées dans main!${NC}"
elif [ "$MERGE_TO_MAIN" = true ]; then
  # Si nous sommes sur develop et que nous voulons fusionner dans main
  if [ "$CURRENT_BRANCH" = "develop" ]; then
    echo -e "${YELLOW}Fusion de develop dans main...${NC}"
    git checkout main
    git merge develop
    git push origin main
    echo -e "${GREEN}Les modifications ont été fusionnées dans main!${NC}"
  else
    echo -e "${RED}Avertissement: L'option --main n'est disponible que depuis develop ou avec --feature${NC}"
  fi
fi

# Retour à la branche d'origine
if [ "$DIRECT_COMMIT" = false ] && [ "$MERGE_TO_MAIN" = false ]; then
  git checkout develop
  echo -e "${BLUE}Retour à la branche develop${NC}"
elif [ "$MERGE_TO_MAIN" = true ]; then
  git checkout develop
  echo -e "${BLUE}Retour à la branche develop${NC}"
fi