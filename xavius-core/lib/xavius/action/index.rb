module Xavius
  module Action
    class Index < Base
      def execute
        resource_class.all
      end
    end
  end
end
