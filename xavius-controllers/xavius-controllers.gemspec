require_relative 'lib/xavius/controllers/version'

Gem::Specification.new do |spec|
  spec.name          = "xavius-controllers"
  spec.version       = Xavius::Controllers::VERSION
  spec.authors       = "Emerson Xavier"
  spec.summary       = %q{Reusable controller utilities}
  spec.description   = %q{Keep your controllers clean and reuse common REST behaviour}
  spec.homepage      = "https://github.com/xavius-rb/xavius/tree/master/xavius-controllers"
  spec.files         = Dir["lib/**/*"]
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.require_paths = ["lib"]

  spec.metadata = {
    "source_code_uri" => spec.homepage,
    "allowed_push_host" => "https://rubygems.org/",
    "changelog_uri" => "https://github.com/xavius-rb/xavius/tree/master/xavius-controllers/CHANGELOG.md"
  }

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec-rails', '~> 3'
  spec.add_development_dependency 'activesupport', '>= 5.0'
  spec.add_development_dependency 'actionpack', '>= 5.0'
end
