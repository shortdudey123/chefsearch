# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chefsearch/version'

Gem::Specification.new do |spec|
  spec.name          = "chefsearch"
  spec.version       = ChefSearch::VERSION
  spec.authors       = ["Grant Ridder"]
  spec.email         = ["shortdudey123@gmail.com"]

  spec.summary       = %q{Quickly search a Chef server}
  spec.description   = %q{Search a Chef server via CLI or API given a role, name, or Chef environment}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.bindir        = 'exe'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'

  spec.add_dependency 'chef'
  spec.add_dependency 'trollop', '~> 2'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'coveralls'
end
