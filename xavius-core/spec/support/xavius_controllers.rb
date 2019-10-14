RSpec.shared_examples :xavius_controller do
  let(:errors) { ActiveModel::Errors.new(resource) }

  describe 'GET #index' do
    it do
      expect(base_class).to receive(:all) { Array.new }
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it do
      expect(base_class).to receive(:find_by).with(id: model.id.to_s) { model }
      get :show, params: { id: model.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it do
      expect(base_class).to receive(:find_by).with(id: nil)
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it do
      expect(base_class).to receive(:find_by).with(id: model.id.to_s) { model }
      get :edit, params: { id: model.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it do
        expect(base_class).to receive(:find_by).with(id: nil) { nil }
        expect(base_class).to receive(:new).with(params).twice { resource }
        expect(resource).to receive(:valid?) { true }
        expect(resource).to receive(:save)
        expect(resource).to receive(:errors) { errors }
        post :create, params: { base_class.to_s.downcase => params }
        expect(response).to be_successful
      end
    end

    context 'with invalid params' do
      it 'does not call save' do
        expect(base_class).to receive(:find_by).with(id: nil)
        expect(base_class).to receive(:new).with(params).twice { resource }
        expect(resource).to receive(:valid?) { false }
        expect(resource).to receive(:assign_attributes)
        expect(resource).not_to receive(:save)
        expect(resource).to receive(:errors).exactly(3).times { errors }
        post :create, params: { base_class.to_s.downcase => params }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it do
        expect(base_class).to receive(:find_by).with(id: "3") { resource }
        expect_any_instance_of(form).to receive(:valid?) { true }
        expect(resource).to receive(:update).with(params)
        expect(resource).to receive(:errors) { errors }
        put :update, params: { id: 3, base_class.to_s.downcase => params }
        expect(response).to be_successful
      end
    end

    context 'with invalid params' do
      it 'does not call update' do
        expect(base_class).to receive(:find_by).with(id: "3") { resource }
        expect_any_instance_of(form).to receive(:valid?) { false }
        expect(resource).not_to receive(:update).with(params)
        expect(resource).to receive(:errors).twice { errors }
        expect(resource).to receive(:assign_attributes)
        put :update, params: { id: 3, base_class.to_s.downcase => params }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it do
      expect(base_class).to receive(:find_by).with(id: "3") { resource }
      expect_any_instance_of(base_class).to receive(:valid?) { true }
      expect(resource).to receive(:destroy)
      delete :destroy, params: { id: 3 }
      expect(response).to be_successful
    end
  end
end
