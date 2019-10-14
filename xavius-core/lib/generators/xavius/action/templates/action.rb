class <%= @namespace.camelize %>::<%= @action_name.camelize %>Action < Xavius::Action::Base
  # check out https://github.com/xavius-rb/xavius#action-classes for everything you can do in here.
  def execute
    raise NotImplementedError, "Your action in app/actions/<%= @namespace %>/<%= @action_name %>_action.rb must be implemented"
  end
end
