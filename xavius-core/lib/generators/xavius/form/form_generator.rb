# frozen_string_literal: true
class Xavius::FormGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  desc 'This generator creates Form classes for you'

  def create_form_class
    @form_name, @namespace = ARGV
    template "form.rb", "app/forms/#{@namespace}/#{@form_name}_form.rb"
  end
end
