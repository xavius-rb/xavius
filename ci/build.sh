#!/bin/sh
set -euo pipefail

echo '--- Bundle Install'
bundle install

echo '--- RSpec'
for dir in $(cat < ci/modules.txt); do
  echo "Running specs for $dir ..."
  cd ${dir} && bundle exec rspec && cd ..
done

