module Xavius
  module Core
    module BaseActions
      def index
        respond_with({}, locals: { collection_name.to_sym => perform_action })
      end

      def new
        respond_with({}, locals: locals)
      end

      def show
        respond_with({}, locals: locals)
      end

      def edit
        respond_with({}, locals: locals)
      end

      def create
        run_save(:new)
      end

      def update
        run_save(:edit)
      end

      def destroy
        respond_with perform_action
      end

      private
       def run_save(fallback_action_name)
         local_resource = perform_action
         if local_resource.errors.any?
           render(fallback_action_name, locals: locals(local_resource))
         else
           respond_with(local_resource)
         end
       end

       def locals(local_resource = nil)
         { instance_name.to_sym => local_resource || resource }
       end

       def perform_action
         action_class.new(params).execute_action
       end
    end
  end
end
