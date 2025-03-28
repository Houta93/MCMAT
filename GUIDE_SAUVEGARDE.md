# Guide d'utilisation du système de sauvegarde GitHub

Ce document explique comment utiliser le système de sauvegarde mis en place pour l'étude technico-économique MCMAT.

## Objectif

Le système de sauvegarde permet de :
- Travailler chapitre par chapitre de manière isolée
- Enregistrer régulièrement les modifications
- Maintenir un historique complet des changements
- Éviter toute perte de données

## Utilisation du script d'automatisation

Un script `commit_chapitre.sh` a été créé pour faciliter l'enregistrement des modifications par chapitre.

### Syntaxe

```bash
./commit_chapitre.sh [dossier_chapitre] [message_commit]
```

### Exemples

```bash
# Pour enregistrer des modifications dans le chapitre sur les relations algéro-turques
./commit_chapitre.sh 03_relations_algero_turques "Ajout des accords commerciaux récents"

# Pour enregistrer des modifications dans le chapitre sur l'analyse financière
./commit_chapitre.sh 10_analyse_financiere "Mise à jour des projections financières"

# Pour enregistrer des modifications dans un sous-dossier (marchés africains)
./commit_chapitre.sh 11_analyse_marches/marches_africains "Ajout de l'analyse du marché nigérian"
```

### Fonctionnement

Le script effectue automatiquement les opérations suivantes :
1. Vérifie si le dossier du chapitre existe
2. Crée ou utilise une branche dédiée au chapitre
3. Ajoute les modifications au suivi Git
4. Crée un commit avec un message descriptif
5. Envoie les modifications vers GitHub
6. Revient à la branche principale

## Bonnes pratiques

Pour garantir une sauvegarde efficace :

1. **Enregistrez fréquemment** : Faites un commit après chaque section importante terminée
2. **Messages clairs** : Utilisez des messages de commit descriptifs qui expliquent les modifications
3. **Travail par chapitre** : Concentrez-vous sur un seul chapitre à la fois
4. **Vérification régulière** : Consultez régulièrement l'historique Git pour suivre l'évolution

## Récupération en cas de problème

Si vous rencontrez un problème :

1. Ne paniquez pas, toutes les versions sont sauvegardées
2. Consultez l'historique des commits avec `git log`
3. Récupérez une version antérieure si nécessaire avec `git checkout [commit_id]`

## Structure des branches

Le système utilise une branche par chapitre :
- `main` : Branche principale contenant la version stable de l'étude
- `chapitre-XX` : Branches dédiées à chaque chapitre (XX étant le numéro du chapitre)

Cette organisation permet de travailler sur différents chapitres en parallèle sans risque de conflits.
