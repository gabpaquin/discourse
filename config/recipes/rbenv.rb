set_default :ruby_version, "2.0.0-p195"

namespace :rbenv do
  desc "Install rbenv, Ruby, and the Bundler gem"
  task :install, roles: :app do    
    run "cd /home/deployer/apps/discourse"
    run "rbenv local #{ruby_version}"
    run "gem install bluepill"
    run "gem install bundler --no-ri --no-rdoc"
    run "rbenv rehash"
  end
  after "deploy:install", "rbenv:install"
end