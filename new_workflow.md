# Proposition de nouvel workflow pour le projet MCMAT

## Objectifs
- Simplifier le processus de travail
- Réduire la confusion entre branches
- Améliorer la traçabilité des modifications
- Faciliter le travail directement sur la branche principale

## Nouvelle organisation proposée

### Structure des branches
- **main** : Branche principale contenant la version stable de l'étude
- **develop** : Branche de développement pour les modifications en cours
- **feature/chapitre-XX** : Branches temporaires pour les nouvelles fonctionnalités ou chapitres

### Workflow simplifié
1. Pour les modifications mineures (corrections, mises à jour) :
   - Travailler directement sur la branche **develop**
   - Fusionner régulièrement dans **main** via pull request

2. Pour les nouveaux chapitres ou modifications importantes :
   - Créer une branche temporaire **feature/chapitre-XX**
   - Fusionner dans **develop** une fois terminé
   - Fusionner **develop** dans **main** via pull request

### Script amélioré
Le script `improved_commit_script.sh` a été amélioré pour :
- Supporter le nouveau workflow
- Offrir plus d'options (commit direct sur main ou develop)
- Gérer automatiquement les branches feature

## Avantages de cette approche
- **Flexibilité** : Possibilité de travailler directement sur la branche principale pour les modifications simples
- **Sécurité** : Conservation de la séparation pour les modifications importantes
- **Simplicité** : Réduction du nombre de branches permanentes
- **Cohérence** : Meilleure organisation du dépôt

## Migration vers le nouveau workflow
1. Nettoyer les branches obsolètes
2. Mettre à jour la documentation
3. Tester le nouveau script
4. Former les contributeurs au nouveau workflow

Cette proposition peut être ajustée selon vos préférences et les besoins spécifiques du projet.