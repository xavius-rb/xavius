require 'rails_helper'
require 'fixtures/application'
require 'fixtures/controllers'
require 'rspec/rails'

RSpec.describe ProductsController, type: :controller do
  it_behaves_like :xavius_controller do
    before do
      allow(base_class).to receive_message_chain(:model_name, :human)
    end

    let(:base_class) { Product }
    let(:form) { base_class }
    let(:model) { build_stubbed(:product) }
    let(:resource) { double("product") }
    let(:params) { ActionController::Parameters.new({ name: 'Ok' }).permit! }
  end
end
