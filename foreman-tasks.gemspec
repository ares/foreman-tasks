# -*- coding: utf-8 -*-

raise <<MESSAGE
This is not the repository you are looking for. The foreman-tasks repository was moved. Please update your Gemfile:

gem 'foreman-tasks', :git => 'https://github.com/theforeman/foreman-tasks.git'
MESSAGE

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "foreman_tasks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "foreman-tasks"
  s.version     = ForemanTasks::VERSION
  s.authors     = ["Ivan Nečas"]
  s.email       = ["inecas@redhat.com"]
  s.homepage    = "https://github.com/iNecas/foreman-tasks"
  s.summary     = "Foreman plugin for showing tasks information for resoruces and users"
  s.description = <<DESC
The goal of this plugin is to unify the way of showing task statuses across the Foreman instance.
It defines Task model for keeping the information about the tasks and Lock for assigning the tasks
to resources. The locking allows dealing with preventing multiple colliding tasks to be run on the
same resource. It also optionally provides Dynflow infrastructure for using it for managing the tasks.
DESC

  s.files = Dir["{app,bin,config,db,lib}/**/*", "LICENSE", "README.md"].reject do |file|
    file.start_with? "lib/foreman_tasks/hammer"
  end
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "uuidtools"
  s.add_dependency "dynflow", '>= 0.6.0'
  s.add_dependency "sequel" # for Dynflow process persistence
  s.add_dependency "sinatra" # for Dynflow web console
  s.add_dependency "daemons" # for running remote executor
end
