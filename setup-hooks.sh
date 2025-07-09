#!/bin/bash
# setup-hooks.sh

# Couleurs pour l'affichage
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "${BLUE}🔧 Setting up Git hooks...${NC}"

# Vérifier qu'on est dans un repo git
if [ ! -d ".git" ]; then
    echo "❌ This is not a Git repository"
    exit 1
fi

# Créer le répertoire des hooks s'il n'existe pas
mkdir -p .git/hooks

# Copier les hooks et les rendre exécutables
echo "${BLUE}📋 Installing commit-msg hook...${NC}"
cp .githooks/commit-msg .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg

echo "${BLUE}📋 Installing pre-commit hook...${NC}"
cp .githooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "${BLUE}📋 Installing pre-push hook...${NC}"
cp .githooks/pre-push .git/hooks/pre-push
chmod +x .git/hooks/pre-push

# Installer les dépendances de développement
echo "${BLUE}📦 Installing development dependencies...${NC}"
if [ -f "backend/requirements/dev.txt" ]; then
    pip install -r backend/requirements/dev.txt
else
    echo "${YELLOW}⚠️  backend/requirements/dev.txt not found${NC}"
fi

# Configurer git pour utiliser les hooks
git config core.hooksPath .git/hooks

echo "${GREEN}✅ Git hooks installed successfully!${NC}"
echo ""
echo "Hooks installed:"
echo "  • commit-msg: Validates commit message format"
echo "  • pre-commit: Runs linting, formatting, and quick tests"
echo "  • pre-push: Runs full test suite and additional checks"
echo ""
echo "To test the hooks:"
echo "  git commit -m 'feat: test commit message validation'"
echo "  git push origin your-branch"