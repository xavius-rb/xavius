class TestController < ActionController::Base
  include Rails.application.routes.url_helpers

  def render(*attributes); end
end

class PostsController < TestController
  include Xavius::Controllers::Base
end
