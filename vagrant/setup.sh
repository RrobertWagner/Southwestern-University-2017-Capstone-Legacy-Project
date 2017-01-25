#!/bin/bash --login

sudo apt-get update
sudo apt-get install -y build-essential curl

# Install rvm + ruby 2.1.5 if not found
type rvm >/dev/null 2>&1
if [ "$?" != "0" ]; then
  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  curl -sSL https://get.rvm.io | bash -s stable
  source $HOME/.bash_profile
  echo "Installing ruby 2.1.5 via rvm, may take some time"
  rvm install 2.1.5 >/dev/null 2>&1
fi

rvm use 2.1.5

# Install bundler gem if not found
type bundle >/dev/null 2>&1
[ "$?" != "0" ] && gem install bundler

exit 0
