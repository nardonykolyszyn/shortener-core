# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.14.1'

# set up app directory and repo
set :application, 'shortener'
set :repo_url, 'git@github.com:nardonykolyszyn/shortener-core.git'
set :username, 'deployer'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public')
set :rbenv_ruby, '2.6.2'
