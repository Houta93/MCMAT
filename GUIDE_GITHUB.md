# Guide d'utilisation du système d'automatisation GitHub

Ce document explique comment utiliser le système d'automatisation mis en place pour travailler efficacement sur l'étude technico-économique MCMAT chapitre par chapitre.

## Structure du dépôt

Le dépôt est organisé avec la structure suivante :

### Dossiers principaux
- `chapitres/` : Contient 18 sous-dossiers (un par chapitre) et le dossier annexes
- `ressources/` : Contient les éléments communs à plusieurs chapitres (images, tableaux, modèles, bibliographie)
- `templates/` : Contient les modèles standardisés pour les chapitres, références et annexes
- `archives/` : Stockage des archives

### Structure des dossiers de chapitres
Chaque dossier de chapitre (00_preambule à 17_perspectives_developpement) contient :
- `README.md` : Description et plan détaillé du chapitre
- `chapitre_XX.md` : Contenu principal du chapitre (où XX est le numéro du chapitre)
- `images/` : Sous-dossier pour les images et graphiques spécifiques au chapitre
- `brouillons/` : Sous-dossier pour les versions de travail et notes

### Documentation des sources
Les sources sont centralisées dans :
- `chapitres/annexes/annexe_e_sources/` : Contient un fichier de références pour chaque chapitre

## Branches et workflow

Le système utilise une branche par chapitre :
- `main` : Branche principale contenant la version stable de l'étude
- `chapitre-XX` : Branches dédiées à chaque chapitre (XX étant le numéro du chapitre)

### Workflow recommandé

1. Travaillez sur un chapitre à la fois, en suivant l'approche séquentielle
2. Utilisez le script `commit_chapitre.sh` pour enregistrer vos modifications
3. Une fois un chapitre terminé, créez une pull request pour fusionner les modifications dans la branche principale
4. Passez au chapitre suivant

## Utilisation du script d'automatisation

Un script `commit_chapitre.sh` a été créé pour faciliter la gestion des modifications par chapitre.

### Comment utiliser le script

1. Effectuez vos modifications dans le dossier du chapitre concerné
2. Exécutez le script avec la commande suivante :
   ```
   ./commit_chapitre.sh [dossier_chapitre] [message_commit]
   ```
   
   Exemple :
   ```
   ./commit_chapitre.sh 03_relations_algero_turques "Mise à jour des accords commerciaux"
   ```

3. Le script va automatiquement :
   - Basculer vers la branche du chapitre
   - Ajouter les modifications du chapitre
   - Ajouter les fichiers de références correspondants dans l'annexe E
   - Mettre à jour le fichier de suivi d'avancement
   - Créer un commit avec un message formaté
   - Pousser les modifications vers GitHub
   - Revenir à la branche principale

## Utilisation des templates

Des templates standardisés ont été créés pour faciliter la rédaction :

1. **Template de chapitre** (`templates/template_chapitre.md`) :
   - Structure standard pour la rédaction d'un nouveau chapitre
   - À utiliser comme point de départ pour chaque nouveau chapitre

2. **Template de références** (`templates/template_references.md`) :
   - Format standard pour documenter les sources avec le système de numérotation en exposant
   - À utiliser pour compléter les fichiers de références dans l'annexe E

3. **Template d'annexe** (`templates/template_annexe.md`) :
   - Structure standard pour la création d'une nouvelle annexe
   - À utiliser pour les annexes A à E

## Bonnes pratiques

1. **Travail séquentiel** : Finalisez un chapitre avant de passer au suivant
2. **Documentation des sources** : Utilisez systématiquement le système de numérotation en exposant et documentez toutes les sources dans l'annexe E
3. **Organisation des images** : Placez les images spécifiques à un chapitre dans son sous-dossier `images/`
4. **Versions de travail** : Utilisez le sous-dossier `brouillons/` pour les versions intermédiaires
5. **Commits réguliers** : Effectuez des commits fréquents avec des messages descriptifs
6. **Suivi d'avancement** : Consultez régulièrement le fichier `SUIVI_AVANCEMENT.md` pour suivre la progression globale

## Besoin d'aide ?

Si vous rencontrez des difficultés avec ce système d'automatisation, n'hésitez pas à me le faire savoir pour que je puisse vous guider.
