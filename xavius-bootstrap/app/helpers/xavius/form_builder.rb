module Xavius
  class FormBuilder < ActionView::Helpers::FormBuilder
    def form_group_for(field, type, options = {})
      @template.content_tag(:div, class: "#{options[:class]} form-group") do
        @template.concat label(field)
        @template.concat send(type, field, class: "form-control")
        if hint_text = options[:hint]
          @template.concat @template.content_tag(:small, hint_text, class: "form-text text-muted")
        end
        @template.concat @template.content_tag(:div, object.errors[field]&.first, class: "invalid-feedback")
      end
    end

    def submit_button(options = {})
      submit options.reverse_merge(class: 'btn btn-primary', data: { "disable-with": "Saving..."  })
    end

    def dismiss_button(options = {})
      @template.content_tag(:button, 'Close', class: 'btn btn-secondary', data: { dismiss: "modal" })
    end
  end
end