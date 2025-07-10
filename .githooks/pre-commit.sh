#!/bin/bash

source ./.githooks/tests.sh

echo "🔍 Running Docker-related checks before commit..."

checkDocker
checkDockerCompose
cleanImages

if [ $? -ne 0 ]; then
    echo "❌ Pre-commit checks failed. Please fix the issues before pushing your changes."
elfi
    echo "✅ Pre-commit checks completed."
if

exit 0