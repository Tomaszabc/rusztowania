require 'rails_helper'

RSpec.describe PartsController, type: :controller do
  let(:user) { create(:user) }

  before(:all) do
    Rails.application.routes.default_url_options[:host] = 'test.host'
  end

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all parts as @parts' do
      part = create(:part)
      get :index
      expect(assigns(:parts)).to eq([part])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested part as @part' do
      part = create(:part)
      get :show, params: { id: part.to_param }
      expect(assigns(:part)).to eq(part)
    end
  end

  describe 'GET #new' do
    it 'assigns a new part as @part' do
      get :new
      expect(assigns(:part)).to be_a_new(Part)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested part as @part' do
      part = create(:part)
      get :edit, params: { id: part.to_param }
      expect(assigns(:part)).to eq(part)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { { name:'New Part', description: 'Description', weight: 10, multipack: 1 } }

      it 'creates a new Part' do
        expect {
          post :create, params: { part: valid_attributes }
        }.to change(Part, :count).by(1)
      end

      it 'redirects to the created part' do
        post :create, params: { part: valid_attributes }
        expect(response).to redirect_to(Part.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { name: nil, description: nil, weight: nil, multipack: nil } }

      it 'does not create a new Part' do
        expect {
          post :create, params: { part: invalid_attributes }
        }.to change(Part, :count).by(0)
      end
    
      it 'renders the new template' do
        post :create, params: { part: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:part) { create(:part) }
    let(:new_attributes) { { name: 'Updated Name' } }

    it 'updates the requested part' do
      patch :update, params: { id: part.to_param, part: new_attributes }
      part.reload
      expect(part.name).to eq('Updated Name')
    end

    it 'redirects to the part' do
      patch :update, params: { id: part.to_param, part: new_attributes }
      expect(response).to redirect_to(part)
    end
  end

  describe 'DELETE #destroy' do
    let!(:part) { create(:part) }

    before do
      @request.host = 'test.host'
    end

    it 'destroys the requested part' do
      expect {
        delete :destroy, params: { id: part.to_param }
      }.to change(Part, :count).by(-1)
    end

    it 'redirects to the parts list' do
      delete :destroy, params: { id: part.to_param }
      expect(response).to redirect_to(parts_url)
    end
  end
end