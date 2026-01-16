#!/bin/bash
# Update content from Claude at 11:00 UTC
# This script updates sections 1-7 in content.json

if [ -f "content-sections-1-7.md" ]; then
    echo "Updating content.json with sections 1-7..."
    
    # Parse markdown file and update JSON
    # This is called after Claude provides the final content
    python3 << 'PYTHON_SCRIPT'
import json
import re

# Read content.json
with open('content.json', 'r') as f:
    data = json.load(f)

# Read markdown source
with open('content-sections-1-7.md', 'r') as f:
    content = f.read()

# Split by section headers (# Section X:)
sections = re.split(r'^# Section \d+:', content, flags=re.MULTILINE)

# Update each section (skip first empty split)
for i, section_text in enumerate(sections[1:8], 1):
    # Clean up the text
    cleaned = section_text.strip()
    # Convert markdown paragraphs to HTML
    paragraphs = cleaned.split('\n\n')
    html_content = ''.join(f'<p>{p.strip()}</p>' for p in paragraphs if p.strip())
    data[str(i)] = html_content

# Write back
with open('content.json', 'w') as f:
    json.dump(data, f, indent=2)

print("✓ Content updated successfully")
PYTHON_SCRIPT
else
    echo "⚠ content-sections-1-7.md not found"
fi
