lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ChunkyText/version'

Gem::Specification.new do |spec|
  spec.name          = "ChunkyText"
  spec.version       = ChunkyText::VERSION
  spec.authors       = ["Doug Steinberg", "Jason Parker"]
  spec.email         = ["dstein-phins@hotmail.com"]
  spec.summary       = %q{ Break up a long string of text into smaller strings for Twitter }
  spec.description   = %q{ Break up a long string of text into nicely formated 140 character strings for Twitter and keping links and punctuation intact. }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "faker"
end
