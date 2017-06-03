require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

desc "Build and test in a container"
task :docker_test do
  sh %{ docker build --force-rm -t fx-potato . && docker run -it --rm fx-potato }
end

task :default => :test
