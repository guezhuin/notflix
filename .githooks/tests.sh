#!/bin/sh

# Function: Check a Dockerfile with hadolint, then try to build it.
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

  echo "🔍 Linting Dockerfile '$path'..."

  if ! hadolint "$path" > /dev/null 2>&1; then
    echo "❌ Linting errors found in '$path'."
  else
    echo "✅ Dockerfile '$path' passed linting."
    checkDockerBuild "test-${directory}" "$filename" "$directory"
  fi
}

# Function: Attempt to build a Docker image from a Dockerfile.
checkDockerBuild() {
  local tag="$1"
  local dockerfile="$2"
  local context="$3"
  local dockerfile_path="$context/$dockerfile"

  if [ -z "$tag" ] || [ -z "$dockerfile" ] || [ -z "$context" ]; then
    echo "❌ Missing arguments for Docker build check."
    exit 1
  elif [ ! -d "$context" ]; then
    echo "❌ Build context directory '$context' not found."
    exit 1
  elif [ ! -f "$dockerfile_path" ]; then
    echo "❌ Dockerfile '$dockerfile' not found in '$context'."
    exit 1
  fi

  echo "🔧 Building Docker image '$tag' from '$dockerfile_path'..."

  if ! docker build -t "$tag" -f "$dockerfile_path" "$context" > /dev/null 2>&1; then
    echo "❌ Failed to build Docker image '$tag'."
  else
    echo "✅ Successfully built Docker image '$tag'."
  fi
}

# Main function for checking Dockerfiles.
checkDocker() {
  checkDockerfile "Dockerfile" "backend"
  # checkDockerfile "Dockerfile" "frontend"
  checkDockerfile "Dockerfile" "nginx"
}

# Function: Validate a docker-compose file.
checkDockerComposeConfig() {
  local file="$1"

  if [ ! -f "$file" ]; then
    echo "❌ File '$file' not found."
    exit 1
  fi

  echo "🔍 Validating Docker Compose configuration in '$file'..."

  if ! docker compose -f "$file" config > /dev/null 2>&1; then
    echo "❌ Invalid Docker Compose configuration in '$file'."
  else
    echo "✅ Docker Compose configuration in '$file' is valid."
    checkDockerComposeBuild "$file"
  fi
}

# Function: Attempt to build all services defined in a docker-compose file.
checkDockerComposeBuild() {
  local file="$1"

  if [ ! -f "$file" ]; then
    echo "❌ File '$file' not found."
    exit 1
  fi

  echo "🔧 Building services defined in '$file'..."

  if ! docker compose -f "$file" build > /dev/null 2>&1; then
    echo "❌ Docker Compose build failed for '$file'."
  else
    echo "✅ Docker Compose build succeeded for '$file'."
  fi
}

# Main function for checking docker-compose files.
checkDockerCompose() {
  checkDockerComposeConfig "docker-compose.dev.yml"
  checkDockerComposeConfig "docker-compose.yml"
}

# Function: Remove test images created during checks.
cleanImages() {
  echo "🧹 Removing temporary Docker images..."
  docker rmi -f test-backend test-frontend test-nginx > /dev/null 2>&1
}

# Run all checks
checkDocker
checkDockerCompose
cleanImages
