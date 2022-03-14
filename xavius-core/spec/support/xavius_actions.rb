RSpec.shared_examples :xavius_action do
  it { is_expected.to be_a_kind_of(Xavius::Action::Base) }

  let(:params) { ActionController::Parameters.new({ controller: 'model_tests' }) }

  describe '#execute_action' do
    subject { action.execute_action }
    let(:action) { described_class.new(params) }
    let(:form_class) { ModelTest }
    let(:resource) { double("resource") }

    before do
      allow(action).to receive(:form_class) { form_class }
    end

    context 'when activerecord instance' do
      before do
        allow(action).to receive(:resource) { resource }
      end

      it do
        expect(resource).to receive(expect_method)
        subject
      end
    end

    context 'with a form class' do
      let(:form_class) { CreateModelTestsForm }

      it { is_expected.to be_a ModelTest }

      context 'and containing errors' do
        let(:form_class) { CreateModelTestsWithErrorsForm }

        it { is_expected.to be_a ModelTest }
        it 'includes :name in errors' do
          expect(subject.errors).to include(:name)
        end
      end
    end
  end
end
