#
# Cookbook Name:: libffi-dev
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "apt-get update"

# OS and dev reqs
package 'git'
package 'ruby-dev'
package 'build-essential'
package 'libsqlite3-dev'
package 'libssl-dev'
package 'libffi-dev'
package 'libpq-dev'
package 'libreadline-dev'

# For paperclip & AWS integration.
package 'imagemagick'