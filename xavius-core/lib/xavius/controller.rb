require 'active_support/concern'
require 'xavius/core/parameters'
require 'xavius/core/base_actions'

module Xavius
  module Controller
    extend ActiveSupport::Concern
    include Xavius::Core::Parameters
    include Xavius::Core::BaseActions

    included do
      if Xavius.try(:bootstrap_layout) || false
        layout Proc.new { |controller| controller.request.xhr? ? "modal" : "xavius" }
      end
    end
  end
end
