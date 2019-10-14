require "bundler/setup"
require "xavius-core"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  # require spec/support files
  Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each { |f| require f }
end
