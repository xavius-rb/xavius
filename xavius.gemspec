require File.expand_path('../lib/xavius/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'xavius'
  s.version     = Xavius::VERSION
  s.summary     = "Xavius is your must have RDD framework for Rails."
  s.description = "Xavius includes nice additional features and modules to make your Rails app even better."
  s.authors     = 'Emerson Xavier'
  s.email       = 'emersonx.engineer@gmail.com'
  s.files       = Dir["lib/**/*"]
  s.homepage    = 'https://github.com/xavius-rb/xavius'
  s.license     = 'MIT'
  s.metadata = {
    "source_code_uri" => "https://github.com/xavius-rb/xavius"
  }

  # Modules
  s.add_dependency 'xavius-core', s.version
end
