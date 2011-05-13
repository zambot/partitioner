# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "partitioner"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/partitioner"
  s.summary     = "get all your tasks parallelized into even buckets."
  s.description = "partitioner. solves the bin packing problem."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "partitioner"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec",  ">= 2.5.0"


  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
