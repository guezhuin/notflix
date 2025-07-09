#!/bin/bash
# uninstall-hooks.sh

# Couleurs pour l'affichage
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "${BLUE}🔧 Uninstalling Git hooks...${NC}"

# Vérifier qu'on est dans un repo git
if [ ! -d ".git" ]; then
    echo "${RED}❌ This is not a Git repository${NC}"
    exit 1
fi

# Liste des hooks à désinstaller
hooks=("commit-msg" "pre-commit" "pre-push")

echo "${BLUE}🗑️  Removing custom hooks...${NC}"

# Supprimer les hooks personnalisés
for hook in "${hooks[@]}"; do
    if [ -f ".git/hooks/$hook" ]; then
        rm ".git/hooks/$hook"
        echo "  ✅ Removed $hook hook"
    else
        echo "  ⚠️  $hook hook not found"
    fi
done

# Supprimer les hooks de sample s'ils existent et les recréer
echo "${BLUE}🔄 Restoring default Git hooks...${NC}"

# Restaurer la configuration par défaut des hooks
git config --unset core.hooksPath 2>/dev/null || true
echo "  ✅ Reset hooksPath to default"

# Vérifier s'il y a des hooks sample par défaut à restaurer
if [ -f ".git/hooks/commit-msg.sample" ]; then
    echo "  ℹ️  Default sample hooks are still available in .git/hooks/"
fi

# Afficher le statut final
echo ""
echo "${GREEN}✅ Git hooks uninstalled successfully!${NC}"
echo ""
echo "Hooks removed:"
for hook in "${hooks[@]}"; do
    echo "  • $hook"
done
echo ""
echo "Git is now using default hook configuration."
echo ""
echo "To reinstall the hooks:"
echo "  ./setup-hooks.sh"
echo ""
echo "To check current hook status:"
echo "  ls -la .git/hooks/"