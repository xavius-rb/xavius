class <%= @namespace.camelize %>::<%= @form_name.camelize %>Form < Xavius::Form::Base
  # Use ActionModel validations to apply validations per action base
  # attr_accessor :title
  # validates_presence_of :title
end
