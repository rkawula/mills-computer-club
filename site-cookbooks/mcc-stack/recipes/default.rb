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

# Using Ruby 2.2.1
include_recipe 'ruby_build'

ruby_build_ruby '2.2.1'

link "/usr/bin/ruby" do
  to "/usr/local/ruby/2.2.1/bin/ruby"
end

gem_package 'bundler' do
  options '--no-ri --no-rdoc'
end

