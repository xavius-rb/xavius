module Xavius
  class UnknownActionClassError < StandardError; end
end

require 'xavius/form/base'

require 'xavius/core/version'
require 'xavius/core/parameters'
require 'xavius/core/responsive_modal'

require 'xavius/action/base'
require 'xavius/action/index'
require 'xavius/action/create'
require 'xavius/action/destroy'
require 'xavius/action/update'

require 'xavius/controller'
require 'xavius/remote_controller'
