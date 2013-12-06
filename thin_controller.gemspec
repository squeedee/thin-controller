# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'thin_controller/version'

Gem::Specification.new do |spec|
  spec.name          = 'thin-controller'
  spec.version       = ThinController::VERSION
  spec.authors       = ['Rasheed Abdul-Aziz']
  spec.email         = %w(squeedee@gmail.com)
  spec.description   = %q{Gem to stub out controllers and use the command pattern instead}
  spec.summary       = %q{Gem to stub out controllers and use the command pattern instead}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'actionpack', '~> 4.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'rails', '~> 4.0.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'simple_bdd'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'sass-rails', '~> 4.0.0'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'uglifier', '>= 1.3.0'
  spec.add_development_dependency 'coffee-rails', '~> 4.0.0'
  spec.add_development_dependency 'jquery-rails'
  spec.add_development_dependency 'turbolinks'
  spec.add_development_dependency 'launchy'
end
