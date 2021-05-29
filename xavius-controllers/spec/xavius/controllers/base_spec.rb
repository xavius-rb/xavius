#require 'rails_helper'
require 'fixtures/application'
require 'fixtures/controllers'
#require 'rails_helper'
#require 'action_controller'

RSpec.describe PostsController do
  let(:base_class) { Post }
  #let(:model) { build_stubbed(:post) }
  #let(:resource) { double("post") }
  #let(:params) { ActionController::Parameters.new({ title: 'Ok' }).permit! }
  #let(:form) { Posts::UpdateForm }

  describe 'GET #index' do
    it do
      expect(base_class).to receive(:all) { Array.new }
      get :index, params: {}
      expect(response).to be_successful
    end
  end
end
