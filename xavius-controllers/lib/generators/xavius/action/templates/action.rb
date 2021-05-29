class <%= @namespace.camelize %>::<%= @action_name.camelize %>Action < Xavius::Actions::Base
  def perform
    raise NotImplementedError, "Your action in app/actions/<%= @namespace %>/<%= @action_name %>_action.rb must be implemented"
  end
end
