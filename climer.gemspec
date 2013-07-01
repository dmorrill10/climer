# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'climer/version'

Gem::Specification.new do |spec|
  spec.name          = "climer"
  spec.version       = Climer::VERSION
  spec.authors       = ["Dustin Morrill"]
  spec.email         = ["morrill@ualberta.ca"]
  spec.description   = %q{Simple CLI timer}
  spec.summary       = %q{Simple CLI timer}
  spec.homepage      = "https://github.com/dmorrill10/climer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'methadone', '~> 1.3.0'
  spec.add_dependency 'time_distribution'
  spec.add_dependency 'rufus-scheduler'
  spec.add_dependency 'libnotify'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'rake', '~> 0.9.2'
  spec.add_development_dependency 'turn', '~> 0.9'
  spec.add_development_dependency 'minitest', '~> 4.7'
  spec.add_development_dependency 'awesome_print', '~> 1.0'
  spec.add_development_dependency 'pry-rescue', '~> 1.0'
  spec.add_development_dependency 'simplecov', '~> 0.7'
  spec.add_development_dependency 'timecop'
end
