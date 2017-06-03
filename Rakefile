require 'bundler/gem_tasks'
require 'rake/testtask'
require 'fxpotato'

Rake::TestTask.new(:unit_test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

desc "Download new exchange rate data"
task :fetch_new_rates do
  FxPotato.fetch_new_rates
end

desc "Bump version and release gem"
task :bump_release do
  sh %{ gem bump && rake release }
end

desc "Build and test in a container"
task :docker_test do
  sh %{ docker build --force-rm -t fx-potato . && docker run --rm fx-potato }
end

desc "Build, test, bump version, and release in a container"
task :docker_release do
  sh %{ docker build --force-rm -t fx-potato . && docker run --rm fx-potato rake test && gem bump && rake release }
end

desc "Run feature and unit tests"
task :test => :unit_test do
  sh %{ bundle exec cucumber features }
end

task :default => :unit_test
