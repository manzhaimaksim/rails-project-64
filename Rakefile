# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'slim_lint/rake_task'
require 'rubocop/rake_task'

Rails.application.load_tasks

SlimLint::RakeTask.new do |t|
  # t.config = 'custom/config.yml'
  t.files = ['app/views']
  t.quiet = true # Don't display output from slim-lint to STDOUT
end

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rails'
end
