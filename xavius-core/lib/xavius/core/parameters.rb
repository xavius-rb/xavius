require 'rails'
require 'action_controller'

module Xavius
  module Core
    module Parameters
      def controller_name
        params[:controller]
      end

      def action_name
        params[:action]
      end

      def resource_class
        class_name.constantize
      end

      def action_class
        @action_class ||= infer_user_class_for('Action') || action_class_name.constantize
      end

      def form_class
        @form_class ||= infer_user_class_for('Form') || resource_class
      end

      def resource
        @resource ||= resource_class.find_by(id: params[:id]) || resource_class.new(resource_params)
      end

      def form
        @form ||= if resource_params.nil?
          resource
        else
          form_class.new(resource_params)
        end
      end

      def index?
        action_name == 'index'
      end

      private
        def action_class_name
          unless action_name.in?(%w(index create update destroy))
            raise Xavius::UnknownActionClassError, "Couldn't find Action class #{action_name.camelize}"
          end

          @action_class_name ||= "Xavius::Action::#{action_name.camelize}".freeze
        end

        def class_name
          controller_name.singularize.camelize.freeze
        end

        def instance_name
          controller_name.gsub("/", "_").singularize.freeze
        end

        def collection_name
          controller_name.gsub("/", "_").freeze
        end

        def resource_params
          begin
            params.require(instance_name.to_sym).permit!
          rescue ActionController::ParameterMissing
            params[instance_name.to_sym]
          end
        end

        def infer_user_class_for(klass_sufix)
          "#{module_parent}::#{controller_name.camelize.demodulize}::#{action_name.camelize}#{klass_sufix}".safe_constantize ||
          "#{controller_name.camelize}::#{action_name.camelize}#{klass_sufix}".safe_constantize
        end

        def module_parent
          if Rails::VERSION::MAJOR > 5
            resource_class.module_parent
          else
            resource_class.parent
          end
        end
    end
  end
end
