## Mills Computer Club website

Development environment:

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
8. Copy the config/initializers/omniauth.rb

Troubleshooting/Known errors:

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