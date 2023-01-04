require "mina/rails"
require "mina/git"
require "mina/rbenv"

set :repository, "git@git.applover.pl:save_a_train/save_a_train_backend.git"
set :forward_agent, true

task :staging do
  set :domain, "INSERT ADDRESS HERE"
  set :user, "save_a_train"
  set :application_name, "save_a_train_backend"
  set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application_name)}"
  set :branch, "dev"
  set :rails_env, "staging"
end

task :production do
  set :domain, "INSERT ADDRESS HERE"
  set :user, "save_a_train"
  set :application_name, "save_a_train_backend"
  set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application_name)}"
  set :branch, "master"
  set :rails_env, "production"
end

set :shared_dirs, fetch(:shared_dirs, []).push("log", "tmp/pids", "tmp/sockets", "public/assets", "public/uploads")
set :shared_files, fetch(:shared_files, []).push("config/master.key")

task :remote_environment do
  invoke :"rbenv:load"
end

task :setup do
  command %{rbenv install 3.1 --skip-existing}
  command %{rbenv shell 3.1}
  command %{gem install bundler}
  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "#{fetch(:shared_path)}/config/master.key"]
  command %[touch "#{fetch(:shared_path)}/config/puma.rb"]
  comment "be sure to edit "#{fetch(:shared_path)}/config/database.yml", "secrets.yml"."
end

desc "sets up environmental variables from env file"
task :env do
  command %{set -a && source #{fetch(:deploy_to)}/env && set +a}
end

namespace :puma do
  desc "restart server via systemd"
  task :restart do
    command %{sudo systemctl restart save_a_train}
  end
end

namespace :sidekiq do
  desc "restart sidekiq via systemd"
  task :restart do
    command %{sudo systemctl restart sidekiq}
  end
end

desc "deploys the current version to the server."
task :deploy do
  deploy do
    invoke :env
    invoke :"git:clone"
    invoke :"deploy:link_shared_paths"
    invoke :"bundle:install"
    invoke :"rails:db_migrate"
    invoke :"rails:assets_precompile"
    invoke :"deploy:cleanup"
  end
end
