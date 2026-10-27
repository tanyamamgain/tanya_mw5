#!/bin/bash
# Agent settings that can only live in the home folder. The rest are in the
# repo: .claude/settings.json, .codex/ and .gemini/settings.json.
#
# Runs from the top folder of the repo, once, when the Codespace is created.
set -e

workspace="$(pwd)"

# Codex reads this repo's .codex/ folder (its rules and config) only in a
# project marked trusted. The path comes from the Codespace, since a copy of
# this repo can have any name.
mkdir -p ~/.codex
cat >> ~/.codex/config.toml <<EOF

[projects."$workspace"]
trust_level = "trusted"
EOF

# Antigravity CLI reads permissions only from the home folder. Routine
# commands run without asking; bin/reset-db always asks.
mkdir -p ~/.gemini/antigravity-cli
cat > ~/.gemini/antigravity-cli/settings.json <<'EOF'
{
  "permissions": {
    "allow": [
      "command(bin/rails test)",
      "command(bin/rails runner)",
      "command(bin/rails db:migrate)",
      "command(bin/rails generate model)",
      "command(bin/rails generate migration)"
    ],
    "ask": [
      "command(bin/reset-db)"
    ]
  }
}
EOF
