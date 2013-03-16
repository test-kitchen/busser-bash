# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kb/bash/version'

Gem::Specification.new do |spec|
  spec.name          = "kb-bash"
  spec.version       = KB::Bash::VERSION
  spec.authors       = ["Fletcher Nichol"]
  spec.email         = ["fnichol@nichol.ca"]
  spec.description   = %q{Bash runner plugin for Kitchen Busser (kb)}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/fnichol/kb-bash-ruby"
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'kb', '~> 1.0.0.alpha.1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'guard-cucumber'

  spec.add_development_dependency 'cane'
  spec.add_development_dependency 'guard-cane'
  spec.add_development_dependency 'tailor'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'countloc'
end
