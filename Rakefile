require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'Run all linters on the codebase'
task :linters do
  Rake::Task['rubocop'].invoke
end

desc 'rubocop compliancy checks'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.patterns = %w{ bin/console exe/chefsearch lib/**/*.rb lib/*.rb spec/*.rb }
end

task default: [:linters, :spec]
