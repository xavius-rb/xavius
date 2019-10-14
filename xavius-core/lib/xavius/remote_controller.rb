require 'active_support/concern'
require 'xavius/core/parameters'
require 'xavius/core/base_actions'
require 'xavius/core/responsive_modal'

module Xavius
  module RemoteController
    extend ActiveSupport::Concern
    include Xavius::Core::Parameters
    include Xavius::Core::BaseActions
    include Xavius::Core::ResponsiveModal

    def new
      render_in_modal(template: modal_template, locals: locals)
    end

    def edit
      render_in_modal(template: modal_template, locals: locals)
    end

    def create
      local_resource = perform_action
      respond_to_modal(local_resource, locals: locals(local_resource))
    end

    def update
      local_resource = perform_action
      respond_to_modal(local_resource, locals: locals(local_resource))
    end

    protected
      def modal_template
        "#{controller_name.gsub("/", "_")}/#{action_name}"
      end

      def perform_action
        action_class.new(params).execute_action
      end
  end
end
