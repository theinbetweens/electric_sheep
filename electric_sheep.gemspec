# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'electric_sheep/version'

Gem::Specification.new do |gem|
  gem.name          = "electric_sheep"
  gem.version       = ElectricSheep::VERSION
  gem.authors       = ["theinbetweens"]
  gem.email         = ["wsangster@theinbetweens.co.uk"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  # gem.add_runtime_dependency 'cucumber', '>= 1.1.1'
  gem.add_development_dependency 'cucumber', '>= 1.1.1'
  gem.add_development_dependency 'aruba', '>= 0.4.11'  
  gem.add_development_dependency 'rspec', '>= 2.7.0'  

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
