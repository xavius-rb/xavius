require 'active_support/all'
require 'action_controller'
require 'action_dispatch'

module Rails
  class App
    def call(options); end;
    def env_config; {} end
    def routes
      return @routes if defined?(@routes)
      @routes = ActionDispatch::Routing::RouteSet.new
      @routes.draw do
        resources :posts
        resources :products
      end
      @routes
    end
  end

  def self.application
    @app ||= App.new
  end
end
