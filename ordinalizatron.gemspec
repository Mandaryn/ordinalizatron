# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ordinalizatron/version"

Gem::Specification.new do |s|
  s.name        = "ordinalizatron"
  s.version     = Ordinalizatron::VERSION
  s.authors     = ["Piotr Marciniak"]
  s.email       = ["mandaryyyn@gmail.com"]
  s.homepage    = "https://github.com/Mandaryn/ordinalizatron"
  s.summary     = %q{Add orinal numbering to your collection}
  s.description = %q{Adds each_with_ordinal_number iterator to collections.}

  s.rubyforge_project = "ordinalizatron"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.7"
  s.add_development_dependency "rake"
  s.add_development_dependency "activerecord", "~> 3.0.0"
  s.add_development_dependency "will_paginate", "~> 3.0"
  s.add_development_dependency "sqlite3-ruby"
end
