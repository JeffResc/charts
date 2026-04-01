#!/usr/bin/env bash
# Regenerates the chart version table in the root README.md
# Usage: update-root-readme.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
README="${REPO_ROOT}/README.md"
CHARTS_DIR="${REPO_ROOT}/charts"

# Build the HTML table
TABLE='<table>
<thead>
<tr class="header">
<th><strong>Chart</strong></th>
<th><strong>Chart Version</strong></th>
<th><strong>App Version</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>'

for chart_dir in "$CHARTS_DIR"/*/; do
  chart_yaml="${chart_dir}Chart.yaml"
  [[ -f "$chart_yaml" ]] || continue

  name=$(python3 -c "
import yaml, sys
with open('$chart_yaml') as f:
    d = yaml.safe_load(f)
print(d.get('name', ''))
")
  version=$(python3 -c "
import yaml, sys
with open('$chart_yaml') as f:
    d = yaml.safe_load(f)
print(d.get('version', ''))
")
  app_version=$(python3 -c "
import yaml, sys
with open('$chart_yaml') as f:
    d = yaml.safe_load(f)
print(d.get('appVersion', ''))
")
  description=$(python3 -c "
import yaml, sys
with open('$chart_yaml') as f:
    d = yaml.safe_load(f)
print(d.get('description', ''))
")

  TABLE+="
<tr>
<td markdown=\"span\"><a href=\"https://github.com/JeffResc/charts/tree/main/charts/${name}\">${name}</a></td>
<td markdown=\"span\">${version}</td>
<td markdown=\"span\">${app_version}</td>
<td markdown=\"span\">${description}</td>
</tr>"
done

TABLE+='
</tbody>
</table>'

# Replace everything between <!-- CHARTS_TABLE_START --> and <!-- CHARTS_TABLE_END -->
if grep -q '<!-- CHARTS_TABLE_START -->' "$README"; then
  # Use perl for multi-line replacement
  perl -i -0pe "s/<!-- CHARTS_TABLE_START -->.*?<!-- CHARTS_TABLE_END -->/<!-- CHARTS_TABLE_START -->\n${TABLE//\//\\/}\n<!-- CHARTS_TABLE_END -->/s" "$README"
else
  # Fallback: replace the existing table block (between ## Available Charts and next ##)
  echo "WARNING: Marker comments not found in README.md. Please add <!-- CHARTS_TABLE_START --> and <!-- CHARTS_TABLE_END --> markers." >&2
  exit 1
fi

echo "Root README.md updated successfully"
