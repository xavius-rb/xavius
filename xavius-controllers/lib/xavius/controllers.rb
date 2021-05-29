module Xavius
  module Controllers
    class Error < StandardError; end
  end
end

require "xavius/controllers/version"
require "xavius/controllers/helpers"
require "xavius/controllers/base"

require "xavius/actions/context"
require "xavius/actions/base"
require "xavius/actions/index"
require "xavius/actions/create"
require "xavius/actions/update"
require "xavius/actions/destroy"
