RSpec.describe Xavius::Action::Index do
  let(:expect_method) { :all }
  let(:params) { ActionController::Parameters.new({ action: 'index', controller: 'model_tests' }) }

  describe '#execute_action' do
    subject { action.execute_action }
    let(:action) { described_class.new(params) }
    let(:resource_class) { ModelTest }

    before do
      allow(resource_class).to receive(:all) { ['1', '2'] }
    end

    context 'when activerecord instance' do
      it do
        expect(action).to receive(:resource_class) { resource_class }
        expect(resource_class).to receive(expect_method)
        subject
      end
    end

    it { is_expected.to respond_to(:count) }
  end
end
