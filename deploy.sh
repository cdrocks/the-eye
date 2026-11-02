#!/bin/sh
# Publish the game to https://precious-tapioca-3703cb.netlify.app
# Only index.html goes live (the game is that one file).
set -e
cd "$(dirname "$0")"
rm -rf .deploy && mkdir .deploy && cp index.html .deploy/
npx -y netlify-cli@17.38.1 deploy --prod --dir .deploy --site a9079c57-1923-4485-a5bd-09b87ce95e0a --message "${1:-update}"
rm -rf .deploy
