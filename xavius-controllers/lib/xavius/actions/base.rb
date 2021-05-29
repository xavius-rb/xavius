require 'forwardable'

module Xavius
  module Actions
    class Base
      extend Forwardable
      def_delegators :@context, :resource_class, :resource, :resource_params

      def initialize(context)
        @context = context
      end
    end
  end
end
