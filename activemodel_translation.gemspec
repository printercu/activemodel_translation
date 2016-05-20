# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activemodel_translation/version'

Gem::Specification.new do |spec|
  spec.name          = "activemodel_translation"
  spec.version       = ActivemodelTranslation::VERSION
  spec.authors       = ["Max Melentiev"]
  spec.email         = ["melentievm@gmail.com"]
  spec.summary       = 'Translation helpers for ActiveModel'
  spec.description   = 'Use lazy translations from models'
  spec.homepage      = 'http://github.com/printercu/activemodel_translation'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activemodel", ">= 3.2", "< 6"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10"
end
