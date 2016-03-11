## Mills Computer Club website

# Development environment:

To develop and test locally, you will need:

Ruby v2.2+ (suggested)
Rails v3.4 (TODO migrate to v4+)

1. Install Ruby/Rails @ railsinstaller.org
2. Add SSH key to your GitHub account
3. Create and/or cd into your folder containing your projects
4. git clone git@github.com:rkawula/mills-computer-club
5. cd mills-computer-club
6. gem install bundle
7. bundle install --without production
8. rake db:migrate && rake db:seed
9. Copy secret key & id into your system's ENV variables, to match the omniauth ENV variable names

# Deployment:

Because all of our developers are horrible people and enjoy knowing their successors suffer, in order to deploy to Heroku you have to:

1. Get the heroku remote added to your cloned git repo
2. git push heroku master
3. IF DB HAS CHANGED:
3a. heroku run rake db:migrate
3b. heroku run rails c (and edit/update any db stuff manually if it's not a CMS'd feature)

If you need to update admin privileges in production:

1. heroku run rails c
2. u = User.find_by_name ('GivenName FamilyName')
3. u.admin = true
4. u.save!
5. exit

# Troubleshooting/Known errors:

"no such file to load -- sqlite3/sqlite3_native" (LoadError)
	+ gem uninstall sqlite3
	+ gem install sqlite3 (possibly unneeded?)
	+ bundle install

ExecJS (Windows error)
	+ Easiest way to fix is to install node.js @ nodejs.org
	+ Add Node to your path (if it doesn't automaticallly)

"Permission denied" error when trying to run rake db:drop
	+ Caused because the database is possibly in use by running programs
	+ Close all console windows/processes using rails
	+ Reopen a console window and try again

Features NYI are on our Trello.

# TODO

Add details on setting ENV variables for omniauth.rb, or move to figaro.
