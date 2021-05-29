module Xavius
  module Actions
    class Create < Base
      def perform
        resource.update(resource_params)
      end
    end
  end
end
