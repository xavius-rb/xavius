module Xavius
  module Controllers
    module Helpers
      protected

      def resource
        instance_variable_get(instance_variable_name_for(instance_name))
      end

      def find_resource
        if params[:id]
          resource_class.find(params[:id])
        else
          resource_class.new
        end
      end

      def resource_class
        class_name.constantize
      end

      def resource_human_name
        resource_class.model_name.human
      end

      def set_resource
        instance_variable_set(instance_variable_name_for(instance_name), find_resource)
      end

      def success_message
        I18n.t('.success', default: I18n.t(:success, scope: [:resource, action_name], resource_name: resource_human_name))
      end

      def controller_name_sanitized
        controller_name.gsub("/", "_")
      end

      private
      def action_class
        infer_user_action_class || "Xavius::Actions::#{action_name.camelize}".constantize
      end

      def infer_user_action_class
        "#{module_parent}::#{controller_name.camelize.demodulize}::#{action_name.camelize}Action".safe_constantize ||
        "#{controller_name.camelize}::#{action_name.camelize}Action".safe_constantize
      end

      def module_parent
        if Rails::VERSION::MAJOR > 5
          resource_class.module_parent
        else
          resource_class.parent
        end
      end

      def instance_variable_name_for(name)
        "@#{name}"
      end

      def class_name
        controller_name.singularize.camelize.freeze
      end

      def collection_name
        controller_name_sanitized.freeze
      end

      def instance_name
        controller_name_sanitized.singularize.freeze
      end
    end
  end
end
