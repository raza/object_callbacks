# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'object_callbacks/version'

Gem::Specification.new do |spec|
  spec.name          = "object_callbacks"
  spec.version       = ObjectCallbacks::VERSION
  spec.authors       = ["Raza Ali"]
  spec.email         = ["tauraz@gmail.com"]
  spec.summary       = 'Ruby object method callbacks'
  spec.description   = 'Callbacks to execute before or after object method call'
  spec.homepage      = "https://github.com/raza/object_callbacks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0") + Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.9"
end
