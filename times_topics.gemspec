# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'times_topics/version'

Gem::Specification.new do |gem|
  gem.name          = "times_topics"
  gem.version       = TimesTopics::VERSION
  gem.authors       = ["Jacqui Maher"]
  gem.email         = ["jacqui.maher@nytimes.com"]
  gem.description   = %q{A simple wrapper for the NYT TimesTags API and Times Topics}
  gem.summary       = %q{Interact with the TimesTags API (http://developer.nytimes.com/docs/timestags_api) with this rubygem. Find people, organizations, locations, and subjects matching queries. Find Times Topics pages for query matches along with related topics, when applicable.}
  gem.homepage      = "http://developer.nytimes.com/docs/timestags_api"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
