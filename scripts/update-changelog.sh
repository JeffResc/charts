#!/usr/bin/env bash
# Prepends a changelog entry to a chart's README.md.gotmpl
# Usage: update-changelog.sh <chart-directory> <new-chart-version> <new-app-version>
set -euo pipefail

CHART_DIR="$1"
NEW_VERSION="$2"
NEW_APP_VERSION="$3"
TEMPLATE="${CHART_DIR}/README.md.gotmpl"

if [[ ! -f "$TEMPLATE" ]]; then
  echo "ERROR: README.md.gotmpl not found at $TEMPLATE" >&2
  exit 1
fi

CHANGELOG_ENTRY="### ${NEW_VERSION}\n- Update appVersion to ${NEW_APP_VERSION}"

# Insert after "## Changelog" line
sed -i "/^## Changelog$/a\\
\\
${CHANGELOG_ENTRY}" "$TEMPLATE"

echo "Added changelog entry for ${NEW_VERSION} to ${TEMPLATE}"
