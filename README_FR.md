# 🎬 Notflix - Plateforme de Streaming Éducative

<div align="center">
  
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Django](https://img.shields.io/badge/Django-4.2-green.svg)
![React](https://img.shields.io/badge/React-18.2-blue.svg)
![TypeScript](https://img.shields.io/badge/TypeScript-5.0-blue.svg)
![License](https://img.shields.io/badge/license-GPL--3.0-red.svg)

*Un clone éducatif de Netflix pour apprendre le développement full-stack*

[🚀 Démarrage rapide](#-démarrage-rapide) • [📋 Fonctionnalités](#-fonctionnalités) • [🏗️ Architecture](#️-architecture) • [🗓️ Planning](#️-planning) • [👥 Équipe](#-équipe)
• [🇬🇧 Readme Anglais](README.md)
</div>

---

## 📋 Table des matières

- [🎯 Objectif du projet](#-objectif-du-projet)
- [✨ Fonctionnalités](#-fonctionnalités)
- [🏗️ Architecture technique](#️-architecture-technique)
- [🛠️ Stack technique](#️-stack-technique)
- [🗓️ Planning de développement](#️-planning-de-développement)
- [🚀 Démarrage rapide](#-démarrage-rapide)
- [📁 Structure du projet](#-structure-du-projet)
- [🔧 Configuration](#-configuration)
- [🧪 Tests](#-tests)
- [📊 CI/CD](#-cicd)
- [📚 Documentation](#-documentation)
- [👥 Équipe](#-équipe)
- [📝 Licence](#-licence)

---

## 🎯 Objectif du projet

> **Notflix** est un projet éducatif visant à développer une plateforme de streaming complète pour renforcer nos compétences en développement full-stack.

### 🎓 Objectifs pédagogiques

- 🔥 Maîtriser **React** et **TypeScript**
- 🐍 Approfondir **Django** et **Django REST Framework**
- 🏗️ Comprendre l'architecture **full-stack**
- 🔄 Pratiquer les méthodes **DevOps** (CI/CD, Docker)
- 👥 Améliorer la collaboration en équipe

---

## ✨ Fonctionnalités

### 🎭 Fonctionnalités principales

| Module | Fonctionnalité | Status |
|--------|----------------|--------|
| 🔐 **Authentification** | Inscription/Connexion JWT | 🔲 À faire |
| 🎬 **Catalogue** | Navigation films/séries | 🔲 À faire |
| 🔍 **Recherche** | Filtres avancés | 🔲 À faire |
| 📺 **Lecteur** | Streaming vidéo | 🔲 À faire |
| 👤 **Profil** | Gestion utilisateur | 🔲 À faire |
| ⭐ **Favoris** | Liste de souhaits | 🔲 À faire |
| 📱 **Responsive** | Design adaptatif | 🔲 À faire |

### 🎯 User Stories

<details>
<summary>📖 Cliquez pour voir les user stories détaillées</summary>

#### 👤 En tant qu'utilisateur, je veux...
- ✅ M'inscrire avec email/mot de passe
- ✅ Me connecter de façon sécurisée
- ✅ Parcourir le catalogue par catégories
- ✅ Rechercher un film/série
- ✅ Regarder une bande-annonce
- ✅ Ajouter des contenus à mes favoris
- ✅ Avoir un profil personnalisé

#### 🛡️ En tant qu'admin, je veux...
- ✅ Gérer le catalogue de contenus
- ✅ Modérer les utilisateurs
- ✅ Voir les statistiques d'usage

</details>

---

## 🏗️ Architecture technique

### 🎨 Schéma de l'architecture

```mermaid
graph TB
    subgraph "Frontend - React"
        A[React App] --> B[Components]
        B --> C[Pages]
        C --> D[Services/API]
    end
    
    subgraph "Backend - Django"
        E[Django REST API] --> F[Models]
        F --> G[Views/Serializers]
        G --> H[Authentication JWT]
    end
    
    subgraph "Database"
        I[PostgreSQL]
    end
    
    subgraph "Infrastructure"
        J[Docker Compose]
        K[Nginx]
        L[GitHub Actions]
    end
    
    A --> E
    E --> I
    J --> A
    J --> E
    J --> I
    K --> A
    L --> J
```

### 📊 Diagramme de données

```mermaid
erDiagram
    USER {
        int id PK
        string email
        string password
        string first_name
        string last_name
        datetime created_at
    }
    
    MOVIE {
        int id PK
        string title
        text description
        string genre
        int duration
        string trailer_url
        string poster_url
        datetime release_date
    }
    
    SERIE {
        int id PK
        string title
        text description
        string genre
        int seasons
        string poster_url
        datetime release_date
    }
    
    FAVORITE {
        int id PK
        int user_id FK
        int content_id
        string content_type
        datetime added_at
    }
    
    USER ||--o{ FAVORITE : "has"
    MOVIE ||--o{ FAVORITE : "can be"
    SERIE ||--o{ FAVORITE : "can be"
```

---

## 🛠️ Stack technique

### 🔧 Backend

| Technologie | Version | Rôle |
|-------------|---------|------|
| 🐍 **Django** | 4.2+ | Framework principal |
| 🔌 **Django REST Framework** | 3.14+ | API REST |
| 🐘 **PostgreSQL** | 15+ | Base de données |
| 🔐 **Simple JWT** | 5.2+ | Authentification |
| 🧪 **Pytest** | 7.4+ | Tests |
| 📊 **ruff** | 0.0.285+ | Analyse de code |

### 🎨 Frontend

| Technologie | Version | Rôle |
|-------------|---------|------|
| ⚛️ **React** | 18.2+ | Bibliothèque UI |
| 📘 **TypeScript** | 5.0+ | Typage statique |
| ⚡ **Vite** | 4.4+ | Bundler |
| 🎨 **Tailwind CSS** | 3.3+ | Framework CSS |
| 📡 **Axios** | 1.5+ | Client HTTP |
| 🧪 **Vitest** | 0.34+ | Tests |

### 🚀 DevOps & Infrastructure

| Technologie | Version | Rôle |
|-------------|---------|------|
| 🐳 **Docker** | 24.0+ | Conteneurisation |
| 🔀 **Docker Compose** | 2.20+ | Orchestration |
| 🌐 **Nginx** | 1.25+ | Reverse proxy |
| 🔄 **GitHub Actions** | - | CI/CD |
| 📋 **Hadolint** | - | Analyse Dockerfile |

---

## 🗓️ Planning de développement

### 📅 Répartition sur 4 semaines

<details>
<summary>🗓️ Semaine 1 : Fondations (Cliquez pour détails)</summary>

#### 🎯 Objectifs
- 🏗️ Setup initial du projet
- 🔐 Système d'authentification
- 📋 Modèles de base

#### 📋 Tâches
- [ ] Configuration environnement Docker
- [ ] Setup Django + DRF
- [ ] Setup React + TypeScript
- [ ] Modèles User, Movie, Serie
- [ ] API authentification JWT
- [ ] Pages Login/Register
- [ ] Tests unitaires de base

#### 👥 Répartition
- **Dev 1** : Backend (Django, modèles, auth)
- **Dev 2** : Frontend (React, auth, routing)

</details>

<details>
<summary>🗓️ Semaine 2 : Catalogue (Cliquez pour détails)</summary>

#### 🎯 Objectifs
- 📺 Affichage du catalogue
- 🔍 Système de recherche
- 🎨 Design responsive

#### 📋 Tâches
- [ ] API CRUD pour contenus
- [ ] Système de filtres
- [ ] Composant catalogue
- [ ] Composant recherche
- [ ] Design responsive Tailwind
- [ ] Tests d'intégration

#### 👥 Répartition
- **Dev 1** : API catalogue, filtres
- **Dev 2** : Interface catalogue, recherche

</details>

<details>
<summary>🗓️ Semaine 3 : Fonctionnalités (Cliquez pour détails)</summary>

#### 🎯 Objectifs
- 📺 Lecteur vidéo basique
- ⭐ Système de favoris
- 👤 Profil utilisateur

#### 📋 Tâches
- [ ] Intégration lecteur vidéo
- [ ] API favoris
- [ ] Gestion profil utilisateur
- [ ] Interface favoris
- [ ] Tests fonctionnels
- [ ] Optimisations performances

#### 👥 Répartition
- **Dev 1** : Lecteur vidéo, API favoris
- **Dev 2** : Interface favoris, profil

</details>

<details>
<summary>🗓️ Semaine 4 : Finalisation (Cliquez pour détails)</summary>

#### 🎯 Objectifs
- 🔧 Déploiement
- 🧪 Tests complets
- 📚 Documentation

#### 📋 Tâches
- [ ] Configuration production
- [ ] Tests end-to-end
- [ ] Documentation API
- [ ] Déploiement
- [ ] Monitoring de base
- [ ] Présentation projet

#### 👥 Répartition
- **Dev 1** : Déploiement, monitoring
- **Dev 2** : Tests, documentation

</details>

### 📊 Suivi des tâches

```
🔲 À faire    🔄 En cours    ✅ Terminé    ⚠️ Bloqué
```

---

## 🚀 Démarrage rapide

### 📋 Prérequis

- 🐳 Docker & Docker Compose
- 🟢 Node.js 18+
- 🐍 Python 3.11+
- 🔧 Git

### ⚡ Installation

```bash
# 1. Cloner le repository
git clone https://github.com/votre-username/notflix.git
cd notflix

# 2. Installer les Git hooks
chmod +x .githooks/*
git config core.hooksPath .githooks

# 3. Lancer l'environnement de développement
docker-compose up -d

# 4. Accéder à l'application
# Frontend: http://localhost:3000
# Backend API: http://localhost:8000
# Admin Django: http://localhost:8000/admin
```

### 🏃‍♂️ Développement

```bash
# Lancer les tests
docker-compose exec backend pytest
docker-compose exec frontend npm test

# Lancer les linters
docker-compose exec backend ruff check .
docker-compose exec frontend npm run lint

# Voir les logs
docker-compose logs -f
```

---

## 📁 Structure du projet

```
notflix/
├── 📁 backend/                 # Application Django
│   ├── 📁 apps/
│   │   ├── 📁 authentication/  # Gestion utilisateurs
│   │   ├── 📁 content/        # Films et séries
│   │   └── 📁 favorites/      # Favoris utilisateurs
│   ├── 📁 config/             # Configuration Django
│   ├── 📁 tests/              # Tests backend
│   └── 📄 requirements.txt
├── 📁 frontend/               # Application React
│   ├── 📁 src/
│   │   ├── 📁 components/     # Composants réutilisables
│   │   ├── 📁 pages/          # Pages principales
│   │   ├── 📁 services/       # Services API
│   │   ├── 📁 hooks/          # Hooks React
│   │   └── 📁 types/          # Types TypeScript
│   ├── 📁 public/
│   └── 📄 package.json
├── 📁 docker/                 # Configuration Docker
├── 📁 docs/                   # Documentation
├── 📁 .githooks/              # Git hooks
├── 📄 docker-compose.yml
├── 📄 README.md
└── 📄 LICENSE
```

---

## 🔧 Configuration

### 🌍 Variables d'environnement

<details>
<summary>📝 Cliquez pour voir la configuration</summary>

#### Backend (.env)
```env
# Base de données
DATABASE_URL=postgresql://user:password@localhost:5432/notflix

# Django
SECRET_KEY=your-secret-key
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1

# JWT
JWT_SECRET_KEY=your-jwt-secret
JWT_ALGORITHM=HS256
JWT_ACCESS_TOKEN_LIFETIME=60

# API
API_VERSION=v1
```

#### Frontend (.env)
```env
# API
VITE_API_URL=http://localhost:8000/api/v1
VITE_API_TIMEOUT=10000

# App
VITE_APP_NAME=Notflix
VITE_APP_VERSION=1.0.0
```

</details>

---

## 🧪 Tests

### 📊 Couverture de tests

| Module | Backend | Frontend | E2E |
|--------|---------|----------|-----|
| 🔐 Auth | 🔲 0% | 🔲 0% | 🔲 0% |
| 📺 Catalog | 🔲 0% | 🔲 0% | 🔲 0% |
| ⭐ Favorites | 🔲 0% | 🔲 0% | 🔲 0% |
| 👤 Profile | 🔲 0% | 🔲 0% | 🔲 0% |

### 🏃‍♂️ Lancer les tests

```bash
# Tests backend
docker-compose exec backend pytest --cov=. --cov-report=html

# Tests frontend  
docker-compose exec frontend npm test -- --coverage

# Tests end-to-end
docker-compose exec frontend npm run test:e2e
```

---

## 📊 CI/CD

### 🔄 GitHub Actions

Notre pipeline CI/CD automatise :

- ✅ **Tests** : Exécution automatique des tests
- 🔍 **Linting** : Analyse de code (ruff, ESLint)
- 🛡️ **Sécurité** : Audit des dépendances
- 🐳 **Build** : Construction des images Docker
- 🔧 **Déploiement** : Déploiement automatique

### 📋 Workflows

- **`test.yml`** : Tests sur chaque push/PR
- **`lint.yml`** : Analyse de code
- **`security.yml`** : Audit de sécurité
- **`deploy.yml`** : Déploiement sur main

---

## 📚 Documentation

### 📖 Documentation disponible

- 📘 **[Documentation technique](docs/technical.md)** - Architecture et design
- 📗 **[Documentation API](docs/api.md)** - Endpoints et exemples
- 📙 **[Guide développeur](docs/developer.md)** - Setup et contribution
- 📕 **[Guide utilisateur](docs/user.md)** - Utilisation de l'application

### 🔗 Liens utiles

- 🌐 **[API Documentation](http://localhost:8000/docs/)** - Swagger UI
- 📊 **[Redoc](http://localhost:8000/redoc/)** - Documentation alternative
- 🏗️ **[Storybook](http://localhost:6006/)** - Composants React

---

## 👥 Équipe

### 🎯 Répartition des rôles

| 👤 Membre | 🎯 Rôle principal | 📧 Contact |
|-----------|-------------------|------------|
| **Dev 1** | Backend Lead | dev1@example.com |
| **Dev 2** | Frontend Lead | dev2@example.com |

### 🤝 Contribution

<details>
<summary>📝 Guide de contribution</summary>

#### 🔄 Workflow Git

1. **Fork** le repository
2. **Clone** votre fork
3. **Créer** une branche feature : `git checkout -b feature/ma-fonctionnalite`
4. **Commit** avec format conventionnel : `feat(auth): add JWT authentication`
5. **Push** vers votre fork
6. **Créer** une Pull Request

#### 📋 Conventions

- **Commits** : [Conventional Commits](https://www.conventionalcommits.org/)
- **Branches** : `feature/`, `bugfix/`, `hotfix/`
- **Code Style** : ruff (Python), ESLint (TypeScript)
- **Tests** : Obligatoires pour nouvelles fonctionnalités

</details>

---

## 📈 Métriques et monitoring

### 📊 Objectifs de performance

- ⚡ **Temps de réponse API** : < 200ms
- 🚀 **Temps de chargement** : < 3s
- 📱 **Responsive** : Support mobile complet
- 🔐 **Sécurité** : Respect OWASP Top 10

### 🔍 Monitoring

- 📊 **Logs** : Centralisés via Docker
- 🚨 **Alertes** : GitHub Actions
- 📈 **Métriques** : À définir

---

## 🎯 Prochaines étapes

### 🚀 Version 2.0 (Idées futures)

- 🤖 **Recommandations** : Algorithme de suggestion
- 💬 **Commentaires** : Système de reviews
- 🎮 **Gamification** : Badges et achievements
- 🌍 **Internationalisation** : Support multilingue
- 📱 **App Mobile** : React Native

---

## 📝 Licence

Ce projet est sous licence **GPL-3.0**. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

## 🙏 Remerciements

Merci à tous les contributeurs et à la communauté open-source pour les outils utilisés dans ce projet.

---

<div align="center">

**🎬 Notflix - Apprenons ensemble le développement full-stack ! 🎬**

[![Made with ❤️](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-red.svg)](https://github.com/votre-username/notflix)

</div>