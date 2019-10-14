require 'active_support/concern'
require 'xavius/core/parameters'
require 'xavius/core/base_actions'

module Xavius
  module Controller
    extend ActiveSupport::Concern
    include Xavius::Core::Parameters
    include Xavius::Core::BaseActions
  end
end
