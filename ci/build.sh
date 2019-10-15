#!/bin/sh
set -euo pipefail

echo '--- Bundle install'
bundle install

echo '--- Running specs'
bundle exec rake


