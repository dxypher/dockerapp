git clone --depth 1 http://bitbucket.org/josemota/dockerapp app

cd app

bundle install

if [[ $/ != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo
  bundle exec rake db:setup && \
  bundle exec rake db:migrate
fi

bunlde exec rails server
