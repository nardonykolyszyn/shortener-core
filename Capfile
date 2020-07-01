# frozen_string_literal: true

# Default capistrano plugins
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
require 'sshkit/sudo'
# Custom Capistrano plugins
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/puma'
# Install capistrano tasks
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx
# Load capistrano tasks
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
