## Mills Computer Club website

# Development environment:

To develop and test locally, you will need:

Ruby v2.2.1
Rails v3.4 (TODO migrate to v4+)

0. Install Vagrant, VirtualBox, Chef, and install the librarian-chef and guest-additions plugins for chef.
1. Add SSH key to your GitHub account
2. Create and/or cd into your folder containing your projects
3. git clone git@github.com:rkawula/mills-computer-club
4. cd mills-computer-club
5. Copy secret key & id into your system's ENV variables, to match the omniauth ENV variable names
6. vagrant up
7. vagrant ssh
8. cd /vagrant
9. bundle install
10. rake db:migrate && rake db:seed
11. rails s -b 0.0.0.0

ALTERNATIVE: Install Ruby 2.2.1 on your own system, follow steps 1-->5, and instead of the vagrant commands, skip straight to line 9. YMMV.

# Deployment:

Because all of our developers are horrible people and enjoy knowing their successors suffer, in order to deploy to Heroku you have to:

1. Get the heroku remote added to your cloned git repo
2. git push heroku master
3. IF DB HAS CHANGED:
3a. heroku run rake db:migrate
3b. heroku run rails c (and edit/update any db stuff manually if it's not a CMS'd feature)

If you need to update admin privileges in production:

```
heroku run rails c
u = User.find_by_name('GivenName FamilyName')
u.admin = true
u.save!
exit
```

# Troubleshooting/Known errors when not using Vagrant:

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

When trying to run rails console, "cannot load such file -- test/unit/testcase (LoadError)"
	+ We added the gem "test-unit" because rails 3 is getting out of date and unsupported. You shouldn't see this error anymore!!! Try doing "bundle install" if you do.

Features NYI are on our Trello.