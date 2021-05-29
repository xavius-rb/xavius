module Xavius
  module Actions
    class Destroy < Base
      def perform
        resource.destroy
      end
    end
  end
end
