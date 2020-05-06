version = File.read(File.expand_path("VERSION", __dir__)).strip

Gem::Specification.new do |s|
  s.name        = 'xavius'
  s.version     = version
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
  s.add_dependency 'xavius-core', version
  s.add_dependency 'xavius-bootstrap', version

  s.add_development_dependency 'bundler', '~> 2.1'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec-rails', '~> 3.9'
  s.add_development_dependency 'pry-byebug', '~> 3.7'
  s.add_development_dependency 'factory_bot', '~> 5.1'
end
