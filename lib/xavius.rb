require 'xavius-core'
require 'xavius-bootstrap'

module Xavius
  # Setup xavius-bootstrap gem
  mattr_accessor :bootstrap_gem
  @@bootstrap_gem = false

  # Setup your controllers to use default layout provided in xavius-bootstrap
  mattr_accessor :bootstrap_layout
  @@bootstrap_layout = false

  def self.version
    File.read(File.expand_path("../VERSION", __dir__)).strip
  end

  def self.setup
    yield self
  end
end
