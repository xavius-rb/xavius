require File.expand_path('../lib/xavius/core/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'xavius-core'
  s.version     = Xavius::Core::VERSION
  s.summary     = "Xavius::Core has the main modules for you to work with RDD"
  s.description = "Xavius::Core is a set of pre-configured controllers, models and forms with clean RDD"
  s.authors     = 'Emerson Xavier'
  s.email       = 'emersonx.engineer@gmail.com'
  s.homepage    = 'https://github.com/xavius-rb/xavius'
  s.license     = 'MIT'
  s.files       = Dir["lib/**/*"]
  s.require_path = "lib"

  s.metadata = {
    "source_code_uri" => "https://github.com/xavius-rb/xavius/tree/master/xavius-core",
    "changelog_uri"   => "https://github.com/xavius-rb/xavius/tree/master/xavius-core/CHANGELOG.md"
  }

  s.add_dependency 'responders', '~> 3.0'
  s.add_dependency 'activemodel', '>= 5.0', '< 6.1'
  s.add_dependency 'activerecord', '>= 5.0', '< 6.1'
  s.add_dependency 'railties', '>= 5.0', '< 6.1'

  s.add_development_dependency 'bundler', '~> 1.17'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec-rails', '~> 3.9'
  s.add_development_dependency 'pry-byebug', '~> 3.7'
  s.add_development_dependency 'factory_bot', '~> 5.1'
end
