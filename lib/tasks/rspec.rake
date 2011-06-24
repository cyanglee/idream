# Note: spec/rake/spectask’ has removed in Rspec2.0
# use ‘rake/testtask’ instead
require 'rake'
require 'rake/testtask'

desc 'Run all spec examples'
Rake::TestTask.new('spec') do |t|
   t.libs << "lib"
   t.libs << "spec"
   t.pattern = 'spec/**/*_spec.rb'
   t.verbose = true
end

task :default => :spec