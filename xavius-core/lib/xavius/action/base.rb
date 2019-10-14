require 'xavius/core/parameters'

module Xavius
  module Action
    class Base
      include Xavius::Core::Parameters

      attr_reader :params

      def initialize(params = {})
        @params = params
      end

      def execute_action
        return execute if action_name == 'index'
        form = form_class.new(resource_params)
        if form.valid?
          execute
        else
          resource.errors.copy!(form.errors)
          resource.assign_attributes(resource_params)
        end
        resource
      end

      protected
        def execute
          raise NotImplementedError, "Your custom action #{self.class} must implement #execute method"
        end
    end
  end
end
