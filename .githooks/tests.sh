#!/bin/bash

# Function: Lint a Dockerfile using hadolint in a Docker container.
checkDockerfile() {
  local filename="$1"
  local directory="$2"
  local path="$directory/$filename"

  if [ -z "$filename" ] || [ -z "$directory" ]; then
    echo "❌ Missing arguments for Dockerfile check."
    exit 1
  elif [ ! -f "$path" ]; then
    echo "❌ Dockerfile '$filename' not found in directory '$directory'."
    exit 1
  fi

  echo "🔍 Linting Dockerfile '$path' using hadolint (Docker)..."

  if ! docker run --rm -i hadolint/hadolint < "$path"; then
    echo "❌ Linting errors found in '$path'."
    return 1
  else
    echo "✅ Dockerfile '$path' passed linting."
  fi
}

# Check all Dockerfiles (lint only).
checkDocker() {
  checkDockerfile "Dockerfile" "backend"
  # checkDockerfile "Dockerfile" "frontend"
  checkDockerfile "Dockerfile" "nginx"
}

# Validate a docker-compose file.
checkDockerComposeConfig() {
  local file="$1"

  if [ ! -f "$file" ]; then
    echo "❌ File '$file' not found."
    exit 1
  fi

  echo "🔍 Validating Docker Compose configuration in '$file'..."

  if ! docker compose -f "$file" config > /dev/null; then
    echo "❌ Invalid Docker Compose configuration in '$file'."
    return 1
  else
    echo "✅ Docker Compose configuration in '$file' is valid."
  fi
}

# Build services from a docker-compose file.
checkDockerComposeBuild() {
  local file="$1"

  if [ ! -f "$file" ]; then
    echo "❌ File '$file' not found."
    exit 1
  fi

  echo "🔧 Building services defined in '$file'..."

  if ! docker compose -f "$file" build; then
    echo "❌ Docker Compose build failed for '$file'."
    return 1
  else
    echo "✅ Docker Compose build succeeded for '$file'."
  fi
}

# Run services from a docker-compose file.
checkDockerComposeRun() {
  local file="$1"

  if [ ! -f "$file" ]; then
    echo "❌ File '$file' not found."
    exit 1
  fi

  echo "🚀 Starting services from '$file'..."

  if ! docker compose -f "$file" up -d; then
    echo "❌ Docker Compose run failed for '$file'."
    return 1
  else
    echo "✅ Docker Compose run succeeded for '$file'."
  fi
}

# Run full Docker Compose check: build + config + run
checkDockerComposeAll() {
  local file="$1"

  if [ -z "$file" ]; then
    echo "❌ Missing argument for docker-compose file check."
    exit 1
  elif [ ! -f "$file" ]; then
    echo "❌ File '$file' not found."
    exit 1
  fi

  if ! checkDockerComposeBuild "$file"; then return 1; fi
  if ! checkDockerComposeConfig "$file"; then return 1; fi
  if ! checkDockerComposeRun "$file"; then return 1; fi
}

# Run checks on all docker-compose files.
checkDockerCompose() {
  checkDockerComposeAll "docker-compose.dev.yml"
  checkDockerComposeAll "docker-compose.yml"
}

# Cleanup: stop and remove containers.
cleanDockerCompose() {
  echo "🧹 Removing temporary Docker Compose containers..."
  docker compose -f docker-compose.dev.yml down > /dev/null 2>&1
  docker compose -f docker-compose.yml down > /dev/null 2>&1
}

# Function: Check Python dependencies for vulnerabilities using pip-audit.
checkPythonDependencies() {
  local container="notflix-backend-dev"
  local tmp_requirements="tmp-requirements.txt"

  echo "🔍 Extracting Python dependencies from container '$container'..."

  if ! docker exec "$container" pip freeze > "$tmp_requirements"; then
    echo "❌ Failed to extract dependencies from '$container'."
    return 1
  fi

  echo "🔎 Running security audit with pip-audit..."

  if ! pip-audit -r "$tmp_requirements"; then
    echo "❌ Vulnerabilities found in Python dependencies."
    rm -f "$tmp_requirements"
    return 1
  else
    echo "✅ No vulnerabilities found in Python dependencies."
  fi

  rm -f "$tmp_requirements"
}

# Function: Check Python code style using ruff.
checkPythonRuff() {
  echo "🔍 Running ruff for Python code style checks..."
  ruff check --fix ./backend
  if [ $? -ne 0 ]; then
    echo "❌ ruff found issues in Python code style."
    return 1
  else
    echo "✅ Python code style checks passed."
  fi
}