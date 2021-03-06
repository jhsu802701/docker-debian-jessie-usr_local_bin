#!/bin/bash

curl https://raw.githubusercontent.com/jhsu802701/docker-debian-jessie-custom/master/dev/check.sh | bash

# BEGIN: activate rbenv
export PATH="/home/winner/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# END: activate rbenv

# BEGIN: activate NVM
export NVM_DIR="/home/winner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# END: activate NVM

nvm use --lts # Activate Node

echo '-------'
echo 'ruby -v'
ruby -v

echo '--------'
echo 'rails -v'
rails -v

echo '------------------'
echo 'gem list "^rails$"'
gem list "^rails$"

echo '---------------------'
echo 'gem list "^nokogiri$"'
gem list "^nokogiri$"

echo '---------------'
echo 'gem list "^pg$"'
gem list "^pg$"

echo '------------------------'
echo 'gem list "^mailcatcher$"'
gem list "^mailcatcher$"
