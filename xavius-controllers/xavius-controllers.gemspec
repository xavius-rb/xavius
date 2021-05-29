require_relative 'lib/xavius/controllers/version'

Gem::Specification.new do |spec|
  spec.name          = "xavius-controllers"
  spec.version       = Xavius::Controllers::VERSION
  spec.authors       = "Emerson Xavier"
  spec.email         = "emersonx.engineer@gmail.com"
  spec.summary       = %q{Reusable controller utilities}
  spec.description   = %q{Keep your controllers clean and reuse common REST behaviour}
  spec.homepage      = "https://github.com/xavius-rb/xavius/tree/master/xavius-controllers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] =  spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/xavius-rb/xavius/tree/master/xavius-controllers/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake', '~> 13.0'
  #spec.add_development_dependency 'rspec', '~> 3.10'
  #spec.add_development_dependency 'rspec-expectations', '~> 3.10'
  spec.add_development_dependency 'rspec-rails', '~> 3'
  spec.add_development_dependency 'activesupport', '>= 5.0'
  spec.add_development_dependency 'actionpack', '>= 5.0'
end
