# Guide d'utilisation du système d'automatisation GitHub

Ce document explique comment utiliser le système d'automatisation mis en place pour travailler efficacement sur l'étude technico-économique MCMAT chapitre par chapitre.

## Structure du dépôt

Le dépôt est organisé avec la structure suivante :
- Un dossier `chapitres` contenant 13 sous-dossiers (un par chapitre)
- Chaque sous-dossier contient un fichier README.md détaillant la structure du chapitre
- Des branches Git dédiées pour chaque chapitre prioritaire

## Branches disponibles

Les branches suivantes ont été créées pour les chapitres prioritaires :
- `chapitre-01-introduction`
- `chapitre-03-analyse-technique`
- `chapitre-04-infrastructure-foncier`
- `chapitre-06-ressources-humaines`
- `chapitre-07-analyse-financiere`

## Utilisation du script d'automatisation

Un script `commit_chapitre.sh` a été créé pour faciliter la gestion des modifications par chapitre.

### Comment utiliser le script

1. Effectuez vos modifications dans le dossier du chapitre concerné
2. Exécutez le script avec la commande suivante :
   ```
   ./commit_chapitre.sh [numéro_chapitre] [message_commit]
   ```
   
   Exemple :
   ```
   ./commit_chapitre.sh 03 "Mise à jour des spécifications techniques"
   ```

3. Le script va automatiquement :
   - Basculer vers la branche du chapitre
   - Ajouter les modifications
   - Créer un commit avec un message formaté
   - Pousser les modifications vers GitHub

## Workflow recommandé

1. Travaillez sur un chapitre à la fois, en commençant par les chapitres prioritaires
2. Utilisez le script pour enregistrer vos modifications
3. Une fois un chapitre terminé, créez une pull request pour fusionner les modifications dans la branche principale
4. Passez au chapitre suivant

Cette approche vous permettra de :
- Travailler de manière séquentielle et méthodique
- Garder un historique clair des modifications par chapitre
- Faciliter la collaboration et la révision
- Maintenir une organisation structurée de votre étude

## Besoin d'aide ?

Si vous rencontrez des difficultés avec ce système d'automatisation, n'hésitez pas à me le faire savoir pour que je puisse vous guider.
