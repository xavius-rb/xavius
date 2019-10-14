module Xavius
  module Action
    class Create < Base
      def execute
        resource.save
      end
    end
  end
end
