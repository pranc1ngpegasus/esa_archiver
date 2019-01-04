# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'esa_archiver/version'

Gem::Specification.new do |spec|
  spec.name          = 'esa_archiver'
  spec.version       = EsaArchiver::VERSION
  spec.authors       = ['Pegasus204']
  spec.email         = ['ride.or.die.2215@gmail.com']

  spec.summary       = 'Archive the esa post that a fixed period of time passed.'
  spec.description   = 'Archive the esa post that a fixed period of time passed.'
  spec.homepage      = 'https://github.com/Pegasus204/esa_archiver'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'date'
  spec.add_runtime_dependency 'dotenv'
  spec.add_runtime_dependency 'esa'
  spec.add_runtime_dependency 'thor'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
