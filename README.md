Projet DevOps : Provisionnement Terraform & Validation Ansible
Ekta Mistry


Q1 : Pourquoi séparer provisionnement et validation ?
La séparation permet de respecter le principe de responsabilité unique :


Terraform définit l'état désiré de l'infrastructure (le "Quoi").

Ansible vérifie l'état de santé réel et la conformité du service (le "Comment ça tourne"). Cela évite de surcharger les scripts de déploiement avec des tests complexes et permet d'utiliser chaque outil pour sa force principale.


Q2 : En quoi les outputs Terraform facilitent l'automatisation ?

Les outputs servent de passerelle entre les outils. Ils permettent d'extraire dynamiquement des données comme l'ID du container ou l'URL du service, évitant ainsi de coder ces informations "en dur" dans les scripts de test ou les pipelines CI/CD


Q3 : Quelle est la valeur d'Ansible dans un rôle non configurant ?

Dans ce projet, Ansible agit comme une couche d'hygiène et de conformité. Il garantit que le service est réellement accessible (test HTTP) et que les politiques de sécurité/disponibilité  sont bien appliquées sans risquer de modifier accidentellement l'infrastructure déjà provisionnée.

Q4 : Comment ce socle évoluerait vers un environnement CI/CD

Ce socle peut être intégré dans un pipeline
1.Stage Plan/Apply : Exécution de Terraform pour monter l'infra.
2.Stage Test/Verify : Exécution du playbook Ansible comme "Smoke Test".
Si Ansible détecte une erreur (code HTTP $\neq$ 200), le pipeline échoue, empêchant le déploiement d'une infrastructure défectueuse en production.
