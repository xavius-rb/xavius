module Xavius
  module Actions
    class Context
      attr_reader :resource_class, :resource

      def initialize(**params)
        @resource         = params.fetch(:resource)
        @resource_class   = @resource.class
        @resource_params  = params.fetch(:resource_params)
      end

      def resource_params
        @resource_params.call
      end
    end
  end
end
