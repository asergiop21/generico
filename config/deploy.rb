require "bundler/capistrano"

role :web
role :app
role :db

set :application, "base_generico.com"
set :repository,  "git@github.com:asergiop21/generico.git" #https://github.com/asergiop21/base.git"
server "104.131.45.139", :web, :app, :db, primary: true
set :deploy_to, '/home/deployer/base'
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :user, 'deployer'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'master'
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
    task :start do ; end
    task :stop do ; end
    task :restart, :roles => :app, :except => {:no_release => true } do
      run "#{try_sudo} touch #{File.join(current_path, 'tmp','restart.txt')}" 
end
    desc "reload the database with seed data"
    task :seed do
      run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
      run "cd #{deploy_to}/current && bundle install vendor/gems"
end
desc "Create Production Database"
task :create do
        puts "\n\n=== Creating the Production Database! ===\n\n"
        run "cd| rake db:create RAILS_ENV=production"
        system "cap deploy:set_permissions"
end
desc "Migrate Production Database"
task :migrate do
        puts "\n\n=== Migrating the Production Database! ===\n\n"
        run "cd #{current_path}; bundle exec rake db:migrate RAILS_ENV=production"
        system "cap deploy:set_permissions"
end
end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
