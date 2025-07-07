# 🎬 Notflix - Educational Streaming Platform

<div align="center">
  
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Django](https://img.shields.io/badge/Django-4.2-green.svg)
![React](https://img.shields.io/badge/React-18.2-blue.svg)
![TypeScript](https://img.shields.io/badge/TypeScript-5.0-blue.svg)
![License](https://img.shields.io/badge/license-GPL--3.0-red.svg)

*An educational Netflix clone for learning full-stack development*

[🚀 Quick Start](#-quick-start) • [📋 Features](#-features) • [🏗️ Architecture](#️-architecture) • [🗓️ Timeline](#️-development-timeline) • [👥 Team](#-team)
• [🇫🇷 French Readme](README_FR.md)
</div>

---

## 📋 Table of Contents

- [🎯 Project Goal](#-project-goal)
- [✨ Features](#-features)
- [🏗️ Technical Architecture](#️-technical-architecture)
- [🛠️ Tech Stack](#️-tech-stack)
- [🗓️ Development Timeline](#️-development-timeline)
- [🚀 Quick Start](#-quick-start)
- [📁 Project Structure](#-project-structure)
- [🔧 Configuration](#-configuration)
- [🧪 Testing](#-testing)
- [📊 CI/CD](#-cicd)
- [📚 Documentation](#-documentation)
- [👥 Team](#-team)
- [📝 License](#-license)

---

## 🎯 Project Goal

> **Notflix** is an educational project aimed at building a complete streaming platform to strengthen our full-stack development skills.

### 🎓 Learning Objectives

- 🔥 Master **React** and **TypeScript**
- 🐍 Deepen **Django** and **Django REST Framework**
- 🏗️ Understand **full-stack** architecture
- 🔄 Practice **DevOps** methodologies (CI/CD, Docker)
- 👥 Improve team collaboration

---

## ✨ Features

### 🎭 Core Features

| Module | Feature | Status |
|--------|---------|--------|
| 🔐 **Authentication** | JWT Login/Register | 🔲 To Do |
| 🎬 **Catalog** | Movies/Series browsing | 🔲 To Do |
| 🔍 **Search** | Advanced filters | 🔲 To Do |
| 📺 **Player** | Video streaming | 🔲 To Do |
| 👤 **Profile** | User management | 🔲 To Do |
| ⭐ **Favorites** | Wishlist | 🔲 To Do |
| 📱 **Responsive** | Mobile-first design | 🔲 To Do |

### 🎯 User Stories

<details>
<summary>📖 Click to see detailed user stories</summary>

#### 👤 As a user, I want to...
- ✅ Register with email/password
- ✅ Login securely
- ✅ Browse catalog by categories
- ✅ Search for movies/series
- ✅ Watch trailers
- ✅ Add content to favorites
- ✅ Have a personalized profile

#### 🛡️ As an admin, I want to...
- ✅ Manage content catalog
- ✅ Moderate users
- ✅ View usage statistics

</details>

---

## 🏗️ Technical Architecture

### 🎨 Architecture Diagram

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
        G --> H[JWT Authentication]
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

### 📊 Database Schema

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

## 🛠️ Tech Stack

### 🔧 Backend

| Technology | Version | Role |
|------------|---------|------|
| 🐍 **Django** | 4.2+ | Main framework |
| 🔌 **Django REST Framework** | 3.14+ | REST API |
| 🐘 **PostgreSQL** | 15+ | Database |
| 🔐 **Simple JWT** | 5.2+ | Authentication |
| 🧪 **Pytest** | 7.4+ | Testing |
| 📊 **ruff** | 0.0.285+ | Code analysis |

### 🎨 Frontend

| Technology | Version | Role |
|------------|---------|------|
| ⚛️ **React** | 18.2+ | UI Library |
| 📘 **TypeScript** | 5.0+ | Static typing |
| ⚡ **Vite** | 4.4+ | Bundler |
| 🎨 **Tailwind CSS** | 3.3+ | CSS Framework |
| 📡 **Axios** | 1.5+ | HTTP Client |
| 🧪 **Vitest** | 0.34+ | Testing |

### 🚀 DevOps & Infrastructure

| Technology | Version | Role |
|------------|---------|------|
| 🐳 **Docker** | 24.0+ | Containerization |
| 🔀 **Docker Compose** | 2.20+ | Orchestration |
| 🌐 **Nginx** | 1.25+ | Reverse proxy |
| 🔄 **GitHub Actions** | - | CI/CD |
| 📋 **Hadolint** | - | Dockerfile analysis |

---

## 🗓️ Development Timeline

### 📅 4-Week Sprint Plan

<details>
<summary>🗓️ Week 1: Foundation (Click for details)</summary>

#### 🎯 Objectives
- 🏗️ Initial project setup
- 🔐 Authentication system
- 📋 Base models

#### 📋 Tasks
- [ ] Docker environment configuration
- [ ] Django + DRF setup
- [ ] React + TypeScript setup
- [ ] User, Movie, Serie models
- [ ] JWT authentication API
- [ ] Login/Register pages
- [ ] Basic unit tests

#### 👥 Team Distribution
- **Dev 1**: Backend (Django, models, auth)
- **Dev 2**: Frontend (React, auth, routing)

</details>

<details>
<summary>🗓️ Week 2: Catalog (Click for details)</summary>

#### 🎯 Objectives
- 📺 Catalog display
- 🔍 Search system
- 🎨 Responsive design

#### 📋 Tasks
- [ ] Content CRUD API
- [ ] Filter system
- [ ] Catalog component
- [ ] Search component
- [ ] Responsive Tailwind design
- [ ] Integration tests

#### 👥 Team Distribution
- **Dev 1**: Catalog API, filters
- **Dev 2**: Catalog interface, search

</details>

<details>
<summary>🗓️ Week 3: Features (Click for details)</summary>

#### 🎯 Objectives
- 📺 Basic video player
- ⭐ Favorites system
- 👤 User profile

#### 📋 Tasks
- [ ] Video player integration
- [ ] Favorites API
- [ ] User profile management
- [ ] Favorites interface
- [ ] Functional tests
- [ ] Performance optimizations

#### 👥 Team Distribution
- **Dev 1**: Video player, favorites API
- **Dev 2**: Favorites interface, profile

</details>

<details>
<summary>🗓️ Week 4: Finalization (Click for details)</summary>

#### 🎯 Objectives
- 🔧 Deployment
- 🧪 Complete testing
- 📚 Documentation

#### 📋 Tasks
- [ ] Production configuration
- [ ] End-to-end tests
- [ ] API documentation
- [ ] Deployment
- [ ] Basic monitoring
- [ ] Project presentation

#### 👥 Team Distribution
- **Dev 1**: Deployment, monitoring
- **Dev 2**: Testing, documentation

</details>

### 📊 Task Tracking

```
🔲 To Do    🔄 In Progress    ✅ Done    ⚠️ Blocked
```

---

## 🚀 Quick Start

### 📋 Prerequisites

- 🐳 Docker & Docker Compose
- 🟢 Node.js 18+
- 🐍 Python 3.11+
- 🔧 Git

### ⚡ Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/notflix.git
cd notflix

# 2. Install Git hooks
chmod +x .githooks/*
git config core.hooksPath .githooks

# 3. Start development environment
docker-compose up -d

# 4. Access the application
# Frontend: http://localhost:3000
# Backend API: http://localhost:8000
# Django Admin: http://localhost:8000/admin
```

### 🏃‍♂️ Development

```bash
# Run tests
docker-compose exec backend pytest
docker-compose exec frontend npm test

# Run linters
docker-compose exec backend ruff check .
docker-compose exec frontend npm run lint

# View logs
docker-compose logs -f
```

---

## 📁 Project Structure

```
notflix/
├── 📁 backend/                 # Django application
│   ├── 📁 apps/
│   │   ├── 📁 authentication/  # User management
│   │   ├── 📁 content/        # Movies and series
│   │   └── 📁 favorites/      # User favorites
│   ├── 📁 config/             # Django configuration
│   ├── 📁 tests/              # Backend tests
│   └── 📄 requirements.txt
├── 📁 frontend/               # React application
│   ├── 📁 src/
│   │   ├── 📁 components/     # Reusable components
│   │   ├── 📁 pages/          # Main pages
│   │   ├── 📁 services/       # API services
│   │   ├── 📁 hooks/          # React hooks
│   │   └── 📁 types/          # TypeScript types
│   ├── 📁 public/
│   └── 📄 package.json
├── 📁 docker/                 # Docker configuration
├── 📁 docs/                   # Documentation
├── 📁 .githooks/              # Git hooks
├── 📄 docker-compose.yml
├── 📄 README.md
└── 📄 LICENSE
```

---

## 🔧 Configuration

### 🌍 Environment Variables

<details>
<summary>📝 Click to see configuration</summary>

#### Backend (.env)
```env
# Database
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

## 🧪 Testing

### 📊 Test Coverage

| Module | Backend | Frontend | E2E |
|--------|---------|----------|-----|
| 🔐 Auth | 🔲 0% | 🔲 0% | 🔲 0% |
| 📺 Catalog | 🔲 0% | 🔲 0% | 🔲 0% |
| ⭐ Favorites | 🔲 0% | 🔲 0% | 🔲 0% |
| 👤 Profile | 🔲 0% | 🔲 0% | 🔲 0% |

### 🏃‍♂️ Running Tests

```bash
# Backend tests
docker-compose exec backend pytest --cov=. --cov-report=html

# Frontend tests
docker-compose exec frontend npm test -- --coverage

# End-to-end tests
docker-compose exec frontend npm run test:e2e
```

---

## 📊 CI/CD

### 🔄 GitHub Actions

Our CI/CD pipeline automates:

- ✅ **Testing**: Automatic test execution
- 🔍 **Linting**: Code analysis (ruff, ESLint)
- 🛡️ **Security**: Dependency auditing
- 🐳 **Build**: Docker image construction
- 🔧 **Deployment**: Automated deployment

### 📋 Workflows

- **`test.yml`**: Tests on every push/PR
- **`lint.yml`**: Code analysis
- **`security.yml`**: Security audit
- **`deploy.yml`**: Deployment on main

---

## 📚 Documentation

### 📖 Available Documentation

- 📘 **[Technical Documentation](docs/technical.md)** - Architecture and design
- 📗 **[API Documentation](docs/api.md)** - Endpoints and examples
- 📙 **[Developer Guide](docs/developer.md)** - Setup and contribution
- 📕 **[User Guide](docs/user.md)** - Application usage

### 🔗 Useful Links

- 🌐 **[API Documentation](http://localhost:8000/docs/)** - Swagger UI
- 📊 **[Redoc](http://localhost:8000/redoc/)** - Alternative documentation
- 🏗️ **[Storybook](http://localhost:6006/)** - React components

---

## 👥 Team

### 🎯 Role Distribution

| 👤 Member | 🎯 Primary Role | 📧 Contact |
|-----------|-----------------|------------|
| **Dev 1** | Backend Lead | dev1@example.com |
| **Dev 2** | Frontend Lead | dev2@example.com |

### 🤝 Contributing

<details>
<summary>📝 Contribution Guide</summary>

#### 🔄 Git Workflow

1. **Fork** the repository
2. **Clone** your fork
3. **Create** a feature branch: `git checkout -b feature/my-feature`
4. **Commit** with conventional format: `feat(auth): add JWT authentication`
5. **Push** to your fork
6. **Create** a Pull Request

#### 📋 Conventions

- **Commits**: [Conventional Commits](https://www.conventionalcommits.org/)
- **Branches**: `feature/`, `bugfix/`, `hotfix/`
- **Code Style**: ruff (Python), ESLint (TypeScript)
- **Tests**: Required for new features

</details>

---

## 📈 Metrics and Monitoring

### 📊 Performance Goals

- ⚡ **API Response Time**: < 200ms
- 🚀 **Load Time**: < 3s
- 📱 **Responsive**: Full mobile support
- 🔐 **Security**: OWASP Top 10 compliance

### 🔍 Monitoring

- 📊 **Logs**: Centralized via Docker
- 🚨 **Alerts**: GitHub Actions
- 📈 **Metrics**: To be defined

---

## 🎯 Next Steps

### 🚀 Version 2.0 (Future Ideas)

- 🤖 **Recommendations**: Suggestion algorithm
- 💬 **Comments**: Review system
- 🎮 **Gamification**: Badges and achievements
- 🌍 **Internationalization**: Multi-language support
- 📱 **Mobile App**: React Native

---

## 📝 License

This project is licensed under **GPL-3.0**. See the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Thanks to all contributors and the open-source community for the tools used in this project.

---

<div align="center">

**🎬 Notflix - Let's learn full-stack development together! 🎬**

[![Made with ❤️](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-red.svg)](https://github.com/your-username/notflix)

</div>