# Guide d'intégration des documents du partenaire

## Objectif
Ce guide détaille la méthodologie à suivre pour intégrer efficacement les documents techniques et informations fournis par le partenaire turc dans l'étude technico-économique MCMAT. Il vise à garantir une utilisation optimale de ces ressources pour la rédaction et la mise à jour des chapitres.

## Organisation des documents partenaire

### Structure de stockage
- Tous les documents techniques fournis par le partenaire sont centralisés dans le dossier `docs/sources_partenaire/`
- Les fiches d'analyse détaillées correspondantes sont stockées dans `docs/fiches_techniques/`
- Cette organisation garantit la traçabilité et facilite l'accès aux informations

### Nomenclature
- Les documents originaux conservent leur nom d'origine pour faciliter la référence
- Les fiches d'analyse suivent la convention : `fiche_[NOM_DU_DOCUMENT_ORIGINAL].md`
- La synthèse globale est nommée `synthese_documents_techniques.md`

## Processus d'intégration des documents

### 1. Réception et centralisation
- À la réception de nouveaux documents du partenaire, les ajouter immédiatement au dossier `docs/sources_partenaire/`
- Effectuer un commit spécifique pour tracer l'ajout de ces documents

### 2. Analyse et création de fiches
- Pour chaque document technique reçu, créer une fiche d'analyse détaillée en français
- Structurer la fiche selon le modèle standardisé :
  * Description générale
  * Contenu principal (avec sous-sections détaillées)
  * Chapitres concernés dans l'étude MCMAT
  * Observations et recommandations
  * Sources et références

### 3. Identification des chapitres concernés
- Pour chaque document, identifier précisément les chapitres qui bénéficieront des informations
- Mettre à jour la synthèse globale pour refléter ces correspondances
- Signaler dans le fichier SUIVI_AVANCEMENT.md les chapitres qui peuvent désormais progresser grâce aux nouvelles informations

### 4. Intégration dans les chapitres
- Lors de la rédaction ou mise à jour d'un chapitre, consulter systématiquement :
  * Les fiches techniques correspondantes
  * Les documents originaux pour les détails spécifiques
  * La synthèse globale pour comprendre les interconnexions
- Extraire les informations pertinentes en respectant la structure du chapitre
- Adapter le niveau de détail technique selon la section concernée

### 5. Référencement
- Toute information issue des documents du partenaire doit être référencée selon le système de numérotation en exposant
- Ajouter les références complètes dans le fichier correspondant de l'annexe E
- Format de référence : `[Numéro] "Titre du document", Partenaire turc MCMAT, Date de réception, Page/Section`

### 6. Validation croisée
- Pour les informations critiques (données financières, capacités, etc.), rechercher une validation par d'autres sources quand c'est possible
- En cas de divergence, privilégier les données du partenaire mais mentionner les écarts dans une note

## Workflow de mise à jour

### Pour les chapitres non commencés
1. Consulter la synthèse des documents techniques pour identifier les informations disponibles
2. Créer la structure du chapitre en tenant compte des données techniques disponibles
3. Intégrer les informations pertinentes dès la première rédaction
4. Référencer systématiquement les sources

### Pour les chapitres existants
1. Identifier les sections pouvant être enrichies par les nouvelles informations
2. Mettre à jour le contenu en intégrant les données techniques
3. Vérifier la cohérence avec le reste du chapitre
4. Mettre à jour les références dans l'annexe E

### Processus de commit
Utiliser le script `improved_commit_script.sh` avec un message explicite mentionnant l'intégration de données partenaire :
```
./improved_commit_script.sh [chapitre] "Intégration des données techniques partenaire sur [sujet]"
```

## Bonnes pratiques

1. **Traduction et adaptation** : Traduire avec précision les termes techniques du turc vers le français, en maintenant la cohérence terminologique

2. **Contextualisation** : Ne pas simplement copier les données, mais les contextualiser dans le cadre de l'étude

3. **Hiérarchisation** : Distinguer les informations essentielles des détails techniques secondaires selon la section concernée

4. **Visualisation** : Adapter les schémas et plans pour les intégrer harmonieusement dans le document final

5. **Mise à jour continue** : Réviser régulièrement les chapitres existants lorsque de nouvelles informations sont disponibles

## Chapitres prioritaires pour l'intégration

Sur la base des documents techniques actuellement disponibles, les chapitres suivants devraient être prioritairement développés ou mis à jour :

1. **Chapitre 4 : Secteur des Matériaux de Construction**
   - Utiliser les spécifications techniques pour situer le projet dans le contexte sectoriel

2. **Chapitre 5 : Analyse Technique**
   - Intégrer les informations sur les processus de production et l'organisation spatiale

3. **Chapitre 6 : Matériel et Équipements**
   - Exploiter l'inventaire détaillé des machines et leurs caractéristiques

4. **Chapitre 7 : Infrastructure et Foncier**
   - Utiliser les plans d'implantation et les données dimensionnelles

5. **Chapitre 9 : Ressources Humaines**
   - S'appuyer sur l'organigramme pour définir la structure organisationnelle

## Conclusion

L'intégration méthodique des documents fournis par le partenaire est essentielle pour garantir la précision technique et la pertinence de l'étude MCMAT. Ce processus systématique permet d'exploiter pleinement les informations disponibles tout en maintenant la cohérence et la traçabilité des sources.
