#!/usr/bin/env python3
"""Convert Bitnami-style @param/@section annotations in values.yaml to helm-docs # -- format."""
import re
import sys

def convert_values_yaml(filepath):
    with open(filepath, 'r') as f:
        lines = f.readlines()

    # Phase 1: Extract @param annotations -> {dotpath: description}
    params = {}
    for line in lines:
        m = re.match(r'^##\s*@param\s+(\S+)\s+(.*)', line)
        if m:
            params[m.group(1)] = m.group(2).strip()

    # Phase 2: Rebuild the file
    output = []
    key_stack = []  # list of (indent_level, key_name)
    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.rstrip('\n')

        # Skip @param lines
        if re.match(r'^##\s*@param\s+', stripped):
            i += 1
            continue

        # Convert @section to section header comment
        m = re.match(r'^##\s*@section\s+(.*)', stripped)
        if m:
            output.append(f'## {m.group(1)}\n')
            i += 1
            continue

        # For YAML key lines, determine the full dotpath and insert # -- if we have a description
        key_match = re.match(r'^(\s*)([\w][\w.-]*):\s*(.*)', stripped)
        if key_match:
            indent = len(key_match.group(1))
            key_name = key_match.group(2)

            # Update key stack based on indentation
            while key_stack and key_stack[-1][0] >= indent:
                key_stack.pop()

            key_stack.append((indent, key_name))
            dotpath = '.'.join(k for _, k in key_stack)

            # Check if we have a @param description for this dotpath
            if dotpath in params:
                desc = params[dotpath]
                indent_str = key_match.group(1)
                output.append(f'{indent_str}# -- {desc}\n')

        output.append(line)
        i += 1

    with open(filepath, 'w') as f:
        f.writelines(output)

    print(f"Converted {filepath}: {len(params)} params processed")

if __name__ == '__main__':
    for path in sys.argv[1:]:
        convert_values_yaml(path)
