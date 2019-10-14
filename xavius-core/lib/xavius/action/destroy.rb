module Xavius
  module Action
    class Destroy < Base
      def execute
        resource.destroy
      end
    end
  end
end
