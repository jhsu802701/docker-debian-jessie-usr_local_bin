#!/bin/bash

# BEGIN: activate NVM
export NVM_DIR="/home/winner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# END: activate NVM

# BEGIN: activate NVM at startup
echo 'export NVM_DIR="/home/winner/.nvm"' >> /home/winner/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> /home/winner/.bashrc
# END: activate NVM at startup

echo '--------------'
echo 'command -v nvm'
command -v nvm

echo '-------------'
echo 'nvm --version'
nvm --version

# BEGIN: install Node
echo '-----------------'
echo 'nvm install --lts'
nvm install --lts
# END: install Node

# BEGIN: activate Node at startup
# The commands to activate NVM at startup were automatically added during installation.
echo 'nvm use --lts' >> /home/winner/.bashrc
# END: activate Node at startup

echo '-------'
echo 'node -v'
node -v

echo '-----------'
echo 'npm version'
npm version

echo '---------------------------'
echo 'BEGIN installation of rbenv'
echo 'git clone https://github.com/sstephenson/rbenv.git /home/winner/.rbenv'
git clone https://github.com/sstephenson/rbenv.git /home/winner/.rbenv
wait

echo 'FINISHED installation of rbenv'
echo '------------------------------'

# BEGIN: activate rbenv
export PATH="/home/winner/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# END: activate rbenv

type rbenv

# BEGIN: activate rbenv upon startup
echo 'export PATH="/home/winner/.rbenv/bin:$PATH"' >> /home/winner/.bashrc
echo 'eval "$(rbenv init -)"' >> /home/winner/.bashrc
# END: activate rbenv upon startup

echo '--------------------------------'
echo 'BEGIN installation of ruby-build'
git clone https://github.com/sstephenson/ruby-build.git /home/winner/.rbenv/plugins/ruby-build
wait
echo 'FINISHED installation of ruby-build'
echo '-----------------------------------'

echo '-----------------------------------------'
echo 'BEGIN installation of rbenv-communal-gems'
mkdir -p /home/winner/.rbenv/plugins
git clone git://github.com/tpope/rbenv-communal-gems.git \
  /home/winner/.rbenv/plugins/rbenv-communal-gems
wait
rbenv communize --all
echo 'FINISHED installation of rbenv-communal-gems'
echo '--------------------------------------------'

echo '--------------------------------------'
echo 'BEGIN installation of rbenv-gem-rehash'
git clone https://github.com/sstephenson/rbenv-gem-rehash.git /home/winner/.rbenv/plugins/rbenv-gem-rehash
echo 'FINISHED installation of rbenv-gem-rehash'
echo '-----------------------------------------'

# rbenv rehash now and upon startup
rbenv rehash
echo 'rbenv rehash' >> /home/winner/.bashrc

echo '----------------------------------'
echo 'BEGIN installation of rbenv-update'
mkdir -p "$(rbenv root)/plugins"
git clone https://github.com/rkh/rbenv-update.git "$(rbenv root)/plugins/rbenv-update"
echo 'FINISHED installation of rbenv-update'
echo '-------------------------------------'

echo 'gem: --no-document' > /home/winner/.gemrc
rbenv install -l

export PATH="/home/winner/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

echo '--------------'
echo 'rbenv versions'
rbenv versions
