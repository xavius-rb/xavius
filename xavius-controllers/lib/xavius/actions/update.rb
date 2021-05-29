module Xavius
  module Actions
    class Update < Base
      def perform
        resource.update(resource_params)
      end
    end
  end
end
