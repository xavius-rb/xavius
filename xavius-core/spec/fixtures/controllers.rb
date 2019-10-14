class TestController < ActionController::Base
  include Rails.application.routes.url_helpers
  respond_to :html, :json

  def render(*attributes); end;
  def default_render
    render :nothing
  end
end

require 'responders'

class PostsController < TestController
  include Xavius::Controller
end

class ProductsController < TestController
  include Xavius::RemoteController
end
