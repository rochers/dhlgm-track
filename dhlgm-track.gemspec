# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dhlgm-track/version'

Gem::Specification.new do |gem|
  gem.name          = "dhlgm-track"
  gem.version       = DHLGM::VERSION
  gem.authors       = ["Scott Rocher"]
  gem.email         = ["scottrocher@gmail.com"]
  gem.description   = %q{Track packages through the DHL Global Mail API}
  gem.summary       = %q{Request, parse, and work with DHL Global Mail API tracking events.}
  gem.homepage      = "https://github.com/rochers/dhlgm-track"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency "nokogiri", ["~> 1.6"]
  gem.add_runtime_dependency "typhoeus", ["~> 0.6"]

  gem.add_development_dependency "awesome_print"
  gem.add_development_dependency "rspec", ["~> 2.14"]
  gem.add_development_dependency "webmock"
end
