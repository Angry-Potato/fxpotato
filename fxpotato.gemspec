# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fxpotato/version"

Gem::Specification.new do |spec|
  spec.name          = "fxpotato"
  spec.version       = FxPotato::VERSION
  spec.authors       = ["Liam Stupid Name Humphreys"]
  spec.email         = ["liam.humphreys1989@gmail.com"]

  spec.summary       = %q{Foreign Exchange currency rates looker-upper.}
  spec.description   = %q{Uses last daily feed from European Central Bank website, and exposes a simple interface to get the conversion rates for one currency to another on a given day.}
  spec.homepage      = "https://github.com/Angry-Potato/fxpotato"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "gem-release", "~> 1.0"
end
