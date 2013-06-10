# This is a set of sample deployment recipes for deploying via Capistrano.
# One of the recipes (deploy:symlink_nginx) assumes you have an nginx configuration
# file at config/nginx.conf. You can make this easily from the provided sample
# nginx configuration file.
#
# For help deploying via Capistrano, see this thread:
# http://meta.discourse.org/t/deploy-discourse-to-an-ubuntu-vps-using-capistrano/6353

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/thin"
load "config/recipes/postgresql"
load "config/recipes/bluepill"
load "config/recipes/check"
load "config/recipes/clockwork"
load "config/recipes/redis"

require 'bundler/capistrano'
require 'sidekiq/capistrano'
require "capistrano-rbenv"

# Repo Settings
# You should change this to your fork of discourse
set :repository, 'git@github.com:Gabey/discourse.git'
set :deploy_via, :remote_cache
set :branch, fetch(:branch, 'master')
set :scm, :git
ssh_options[:forward_agent] = true

# General Settings
set :deploy_type, :deploy
default_run_options[:pty] = true

# Server Settings
set :user, "deployer"
set :use_sudo, false
set :rails_env, :production

role :app, 'npathway.com', primary: true
role :db,  'npathway.com', primary: true
role :web, 'npathway.com', primary: true

# Application Settings
set :application, 'discourse'
set :deploy_to, "/home/#{user}/apps/#{application}"

# Perform an initial bundle
after "deploy:setup" do
  run "cd #{current_path} && bundle install"
end
