module Xavius
  module Core
    module ResponsiveModal
      def render_in_modal(template:, locals: {})
        render template: template, layout: 'modal', locals: locals
      end

      def respond_to_modal(resource, notice: nil, url: nil, locals: {})
        notice ||= I18n.t("flash.actions.#{action_name}.notice", resource_name: resource_class.model_name.human)
        if resource.errors.none?
          flash.notice = notice
          render template: "shared/refresh_content", locals: locals.merge(resource_url: url)
        else
          render partial: "form", status: :unprocessable_entity, locals: locals, content_type: "text/html"
        end
      end
    end
  end
end
