namespace :bluepill do

  desc "Generate the database.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "discourse.pill.erb", "#{shared_path}/config/discourse.pill"
  end
  after "deploy:setup", "bluepill:setup"  

  desc "Symlink the database.yml file into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/discourse.pill #{release_path}/config/discourse.pill"
  end
  after "deploy:finalize_update", "bluepill:symlink"  

  desc "Start the Redis server"
  task :start do
    run "redis-server /etc/redis.conf"
  end

  desc "Stop the Redis server"
  task :stop do
    run 'echo "SHUTDOWN" | nc localhost 6379'
  end

end