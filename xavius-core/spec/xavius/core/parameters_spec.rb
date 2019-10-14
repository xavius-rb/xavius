RSpec.describe Xavius::Core::Parameters do
  class Dummie
    include Xavius::Core::Parameters
    attr_reader :params

    def initialize(params)
      @params = ActionController::Parameters.new(params)
    end
  end

  let(:params) do
    {
      controller: controller,
      action: action,
      id: id
    }
  end

  let(:dummy_instance) { Dummie.new(params) }
  let(:action) { '' }
  let(:controller) { '' }
  let(:id) { '' }

  describe '#resource_class' do
    subject { dummy_instance.resource_class }

    context 'simple controller' do
      let(:controller) { 'posts' }
      it { is_expected.to eq Post }
    end

    context 'namespace controller' do
      let(:controller) { 'portal/posts' }
      it { is_expected.to eq Portal::Post }
    end
  end

  describe '#action_class' do
    subject { dummy_instance.action_class }

    context 'simple controller' do
      let(:controller) { 'posts' }

      context 'simple action' do
        let(:action) { 'update' }
        it { is_expected.to eq Posts::UpdateAction }
      end

      context 'custom action' do
        let(:action) { 'find_data' }
        it { is_expected.to eq Posts::FindDataAction }
      end
    end

    context 'namespaced controller' do
      let(:controller) { 'portal/posts' }

      context 'simple action' do
        let(:action) { 'update' }
        it { is_expected.to eq Portal::Posts::UpdateAction }
      end

      context 'custom action' do
        let(:action) { 'find_data' }
        it { expect{ subject }.to raise_error(Xavius::UnknownActionClassError) }
      end
    end
  end

  describe '#form_class' do
    subject { dummy_instance.form_class }

    context 'simple controller' do
      let(:controller) { 'posts' }

      context 'simple action' do
        let(:action) { 'update' }
        it { is_expected.to eq Posts::UpdateForm }
      end

      context 'special action' do
        let(:action) { 'find_data' }
        it { is_expected.to eq Posts::FindDataForm }
      end
    end

    context 'namespace controller' do
      let(:controller) { 'portal/posts' }

      context 'simple action' do
        let(:action) { 'update' }
        it { is_expected.to eq Portal::Posts::UpdateForm }
      end

      context 'special action' do
        let(:action) { 'find_data' }
        it { is_expected.to eq Portal::Post }
      end
    end
  end

  describe '#resource' do
    subject { dummy_instance.resource }
    let(:controller) { 'posts' }

    context 'when resource does not exist' do
      before do
        allow(Post).to receive(:find_by).with(hash_including(:id)) { nil }
      end

      it { is_expected.to be_an_instance_of(Post) }
    end

    context 'when resource exists' do
      let(:id) { 3 }
      let(:post_instance) { Post.new(id: 3) }

      before do
        allow(Post).to receive(:find_by).with(id: 3) { post_instance }
      end

      it { is_expected.to eq post_instance }
    end
  end
end
