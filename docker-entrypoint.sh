git clone --depth 1 https://github.com/dxypher/dockerapp.git

cd app

source "/usr/local/share/chruby/chruby.sh"
chruby ruby

gem install bundler

bundle install
bundle exec rake db:migrate

if [[ $/ != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo
  bundle exec rake db:setup && \
  bundle exec rake db:migrate
fi

bunlde exec rails server
