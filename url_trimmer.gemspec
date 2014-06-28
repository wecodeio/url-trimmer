# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_trimmer/version'

Gem::Specification.new do |spec|
  spec.name          = "url_trimmer"
  spec.version       = URLTrimmer::VERSION
  spec.authors       = ["Cristian Rasch"]
  spec.email         = ["cristian@box.cristianrasch.com.ar"]
  spec.summary       = %q{Reads in plain text files with one URL per line and outputs a list of unique URLs by domain}
  spec.homepage      = "https://github.com/wecodeio/url_trimmer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "domain_name"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
