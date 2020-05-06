version = File.read(File.expand_path("../VERSION", __dir__)).strip

Gem::Specification.new do |s|
  s.name        = 'xavius-bootstrap'
  s.version     = version
  s.summary     = "Xavius::Bootstrap includes a modern layout and a set of helpers"
  s.description = "Xavius::Bootstrap is a nice ERB/HAML Bootstrap layout and helpers to use in your views"
  s.authors     = 'Emerson Xavier'
  s.email       = 'emersonx.engineer@gmail.com'
  s.homepage    = 'https://github.com/xavius-rb/xavius/tree/master/xavius-bootstrap'
  s.license     = 'MIT'
  s.files       = Dir["lib/**/*"]
  s.require_path = "lib"

  s.metadata = {
    "source_code_uri" => s.homepage,
    "changelog_uri"   => "https://github.com/xavius-rb/xavius/tree/master/xavius-bootstrap/CHANGELOG.md"
  }

  s.add_development_dependency 'bundler', '~> 2.1'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec-rails', '~> 3.9'
end
