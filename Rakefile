require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/activemodel_translation'
  t.libs << 'test'
  t.test_files = FileList['test/lib/activemodel_translation/*_test.rb']
  t.verbose = true
end

task default: :test