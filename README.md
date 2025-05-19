# Étude Technico-Économique MCMAT

Ce dépôt contient l'ensemble des documents relatifs à l'étude technico-économique MCMAT (Manufacture des Carrelages et Marbres Algéro-Turc), organisés de manière structurée pour faciliter le travail chapitre par chapitre.

## Structure du dépôt

### Dossiers principaux
- **chapitres/** : Contient 18 sous-dossiers (un par chapitre) et le dossier annexes
- **ressources/** : Contient les éléments communs à plusieurs chapitres (images, tableaux, modèles, bibliographie)
- **templates/** : Contient les modèles standardisés pour les chapitres, références et annexes
- **archives/** : Stockage des archives

### Structure des dossiers de chapitres
Chaque dossier de chapitre (00_preambule à 17_perspectives_developpement) contient :
- `README.md` : Description et plan détaillé du chapitre
- `chapitre_XX.md` : Contenu principal du chapitre (où XX est le numéro du chapitre)
- `images/` : Sous-dossier pour les images et graphiques spécifiques au chapitre
- `brouillons/` : Sous-dossier pour les versions de travail et notes

### Documentation des sources
Les sources sont centralisées dans :
- `chapitres/annexes/annexe_e_sources/` : Contient un fichier de références pour chaque chapitre

## Méthodologie de travail

L'approche adoptée est séquentielle, avec un travail chapitre par chapitre. Chaque chapitre est finalisé avant de passer au suivant, permettant ainsi un meilleur contrôle du processus et assurant que chaque partie soit bien aboutie.

### Workflow recommandé
1. Travailler sur un chapitre à la fois, en suivant l'ordre logique de l'étude
2. Utiliser les templates standardisés pour la rédaction
3. Documenter rigoureusement les sources dans l'annexe E
4. Utiliser le script `commit_chapitre.sh` pour enregistrer les modifications
5. Suivre l'avancement via le fichier `SUIVI_AVANCEMENT.md`

## Guides et documentation

Plusieurs guides sont disponibles pour faciliter le travail :

- **GUIDE_GITHUB.md** : Instructions sur l'utilisation du système d'automatisation GitHub
- **GUIDE_SAUVEGARDE.md** : Explications sur le système de sauvegarde et l'utilisation du script de commit
- **guide_style_mise_en_page.md** : Standards de présentation et de mise en page pour tous les chapitres

## Templates disponibles

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

## Gestion des versions

Ce projet utilise Git pour le suivi des modifications, avec une branche dédiée par chapitre :
- `main` : Branche principale contenant la version stable de l'étude
- `chapitre-XX` : Branches dédiées à chaque chapitre (XX étant le numéro du chapitre)

Le script `commit_chapitre.sh` facilite la gestion des modifications en :
- Basculant vers la branche du chapitre
- Ajoutant les modifications du chapitre et les fichiers de références
- Mettant à jour le fichier de suivi d'avancement
- Créant un commit avec un message formaté
- Poussant les modifications vers GitHub

## Suivi d'avancement

Le fichier `SUIVI_AVANCEMENT.md` permet de suivre la progression de l'étude avec :
- Un tableau récapitulatif de l'état d'avancement de chaque chapitre
- Des détails sur le contenu réalisé et les points à améliorer
- Des recommandations pour les prochaines étapes

## Objectif de l'étude

Cette étude technico-économique vise à évaluer la faisabilité et la viabilité du projet MCMAT, une manufacture de carrelages décoratifs alliant savoir-faire traditionnel et technologies modernes, dans le cadre d'un partenariat algéro-turc.

L'étude sera exhaustive (250-300 pages) et couvrira tous les aspects du projet : contexte économique, relations algéro-turques, analyse technique, infrastructure, ressources humaines, analyse financière, stratégie commerciale, cadre juridique, et perspectives de développement.
