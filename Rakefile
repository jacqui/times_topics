require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "times_topics"
    gem.summary = %Q{A simple wrapper for the TimesTags API and Times Topics}
    gem.description = %Q{Interact with the TimesTags API (http://developer.nytimes.com/docs/timestags_api) with this rubygem. Find people, organizations, locations, and subjects matching queries. Find Times Topics pages for query matches along with related topics, when applicable.}
    gem.email = "jacqui.maher@nytimes.com"
    gem.homepage = "http://github.com/jacqui/times_topics"
    gem.authors = ["Jacqui Maher"]
    gem.add_development_dependency "shoulda", ">= 0"
    gem.add_development_dependency "mocha", ">= 0"
    gem.add_development_dependency "yard", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
