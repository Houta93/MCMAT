# Guide d'utilisation du système de sauvegarde GitHub

Ce document explique comment utiliser le système de sauvegarde mis en place pour l'étude technico-économique MCMAT.

## Objectif

Le système de sauvegarde permet de :
- Travailler chapitre par chapitre de manière isolée et séquentielle
- Enregistrer régulièrement les modifications
- Maintenir un historique complet des changements
- Mettre à jour automatiquement le suivi d'avancement
- Documenter rigoureusement les sources
- Éviter toute perte de données

## Structure standardisée

Pour faciliter la sauvegarde et le suivi, chaque chapitre suit une structure standardisée :
- `README.md` : Description et plan détaillé du chapitre
- `chapitre_XX.md` : Contenu principal du chapitre (où XX est le numéro du chapitre)
- `images/` : Sous-dossier pour les images et graphiques spécifiques au chapitre
- `brouillons/` : Sous-dossier pour les versions de travail et notes

Les sources sont centralisées dans :
- `chapitres/annexes/annexe_e_sources/references_chapitre_XX.md`

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

### Fonctionnement amélioré

Le script effectue automatiquement les opérations suivantes :
1. Vérifie si le dossier du chapitre existe
2. Crée ou utilise une branche dédiée au chapitre
3. Ajoute les modifications au suivi Git
4. Ajoute également les fichiers de références dans l'annexe E
5. Met à jour le fichier de suivi d'avancement (SUIVI_AVANCEMENT.md)
6. Crée un commit avec un message descriptif
7. Envoie les modifications vers GitHub
8. Revient à la branche principale

## Suivi d'avancement automatisé

Le fichier `SUIVI_AVANCEMENT.md` est automatiquement mis à jour par le script de commit avec :
- L'état d'avancement du chapitre (Non commencé, En cours, Révision, Terminé)
- Le pourcentage d'avancement estimé
- La date de dernière modification
- Les détails du contenu réalisé et des points à améliorer

## Bonnes pratiques

Pour garantir une sauvegarde efficace :

1. **Enregistrez fréquemment** : Faites un commit après chaque section importante terminée
2. **Messages clairs** : Utilisez des messages de commit descriptifs qui expliquent les modifications
3. **Travail séquentiel** : Finalisez un chapitre avant de passer au suivant
4. **Documentation des sources** : Mettez à jour les fichiers de références dans l'annexe E
5. **Organisation des images** : Placez les images dans le sous-dossier `images/` du chapitre
6. **Versions de travail** : Utilisez le sous-dossier `brouillons/` pour les versions intermédiaires
7. **Vérification régulière** : Consultez régulièrement l'historique Git et le suivi d'avancement

## Récupération en cas de problème

Si vous rencontrez un problème :

1. Ne paniquez pas, toutes les versions sont sauvegardées
2. Consultez l'historique des commits avec `git log`
3. Récupérez une version antérieure si nécessaire avec `git checkout [commit_id]`
4. Pour les problèmes plus complexes, utilisez `git reflog` pour retrouver des états précédents

## Structure des branches

Le système utilise une branche par chapitre :
- `main` : Branche principale contenant la version stable de l'étude
- `chapitre-XX` : Branches dédiées à chaque chapitre (XX étant le numéro du chapitre)

Cette organisation permet de travailler sur différents chapitres en parallèle sans risque de conflits, tout en privilégiant l'approche séquentielle recommandée.
