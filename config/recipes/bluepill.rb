namespace :bluepill do

  desc "Generate the database.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "bluepill.yml.erb", "#{shared_path}/config/bluepill.yml"
  end
  after "deploy:setup", "bluepill:setup"  

  desc "Start the Redis server"
  task :start do
    run "redis-server /etc/redis.conf"
  end

  desc "Stop the Redis server"
  task :stop do
    run 'echo "SHUTDOWN" | nc localhost 6379'
  end

end