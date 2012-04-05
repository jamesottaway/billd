# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "buildp/version"

Gem::Specification.new do |s|
  s.name        = "buildp"
  s.version     = BuildP::VERSION
  s.authors     = ["James Ottaway"]
  s.email       = ["james@ottaway.mp"]
  s.homepage    = ""
  s.summary     = %q{It parses builds}
  s.description = %q{For those times when you need to control something based on the status of your build}

  s.rubyforge_project = "buildp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "nokogiri"
  s.add_development_dependency "rspec"
  s.add_development_dependency "aruba"
end
