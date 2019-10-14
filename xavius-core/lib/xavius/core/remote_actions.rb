module Xavius
  module Core
    module RemoteActions
      include Actions
      include ResponsiveModal

      def new(options = {})
        render_in_modal(options.reverse_merge(template: modal_template, locals: resource_locals))
      end

      def edit(options = {})
        render_in_modal(options.reverse_merge(template: modal_template, locals: resource_locals))
      end

      def create
        resource = perform_action(permitted_attributes!)
        respond_to_modal(resource, locals: resource_locals(local_resource: resource))
      end

      def update
        resource = perform_action(permitted_attributes!)
        respond_to_modal(resource, locals: resource_locals(local_resource: resource))
      end

      protected
        def modal_template
          "#{controller_name_sanitized}/#{action_name}"
        end
    end
  end
end
