#!/usr/bin/env bash
# Bumps the patch version of a Helm chart's Chart.yaml
# Usage: bump-chart-version.sh <chart-directory>
set -euo pipefail

CHART_DIR="$1"
CHART_YAML="${CHART_DIR}/Chart.yaml"

if [[ ! -f "$CHART_YAML" ]]; then
  echo "ERROR: Chart.yaml not found at $CHART_YAML" >&2
  exit 1
fi

# Extract current version
CURRENT_VERSION=$(grep '^version:' "$CHART_YAML" | head -1 | awk '{print $2}')

# Split into major.minor.patch
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

# Increment patch
NEW_PATCH=$((PATCH + 1))
NEW_VERSION="${MAJOR}.${MINOR}.${NEW_PATCH}"

# Replace version in Chart.yaml (only the first 'version:' line)
sed -i "0,/^version:.*/s/^version:.*/version: ${NEW_VERSION}/" "$CHART_YAML"

echo "$NEW_VERSION"
