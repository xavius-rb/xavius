module Xavius
  module Action
    class Update < Base
      def execute
        resource.update(resource_params)
      end
    end
  end
end
