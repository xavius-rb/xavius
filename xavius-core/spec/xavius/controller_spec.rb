require 'rails_helper'
require 'fixtures/application'
require 'fixtures/controllers'
require 'rspec/rails'

RSpec.describe PostsController, type: :controller do
  it_behaves_like :xavius_controller do
    let(:base_class) { Post }
    let(:model) { build_stubbed(:post) }
    let(:resource) { double("post") }
    let(:params) { ActionController::Parameters.new({ title: 'Ok' }).permit! }
    let(:form) { Posts::UpdateForm }
  end
end
