# frozen_string_literal: true
class Xavius::ActionGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  desc 'This generator creates Action classes for you'

  def create_action_class
    @action_name, @namespace = ARGV
    template "action.rb", "app/actions/#{@namespace}/#{@action_name}_action.rb"
  end
end
