module Xavius
  module Actions
    class Index < Base
      def perform
        resource_class.all
      end
    end
  end
end
