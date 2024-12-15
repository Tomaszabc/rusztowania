# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:cart) { create(:cart) }
    let(:part) { create(:part) }
    let(:cart_item) { create(:cart_item, cart: cart) }

    before do
      sign_in user
    end

    context 'when adding a new cart item' do
      it 'creates a new cart item and redirects' do
        expect do
          post :create, params: { cart_item: { part_id: part.id, quantity: 1 } }
        end.to change(CartItem, :count).by(1)

        expect(response).to have_http_status(:redirect)

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq 'Successfully added'
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:cart) { create(:cart) }
    let!(:cart_item) { create(:cart_item, cart: cart) }

    before do
      sign_in user
    end

    it 'deletes the cart item' do
      expect do
        delete :destroy, params: { cart_id: cart.id, id: cart_item.id }
      end.to change(CartItem, :count).by(-1)
    end

    it 'redirects to the cart path' do
      delete :destroy, params: { cart_id: cart.id, id: cart_item.id }
      expect(response).to redirect_to(cart_path(cart))
      expect(flash[:notice]).to eq 'Item deleted'
    end
  end

  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let(:cart) { create(:cart) }
    let!(:cart_item) { create(:cart_item, cart: cart, quantity: 5) }

    before do
      sign_in user
    end

    context 'with valid attributes' do
      it 'updates the cart item and redirects' do
        patch :update, params: { cart_id: cart.id, id: cart_item.id, cart_item: { quantity: 10 } }
        cart_item.reload

        expect(cart_item.quantity).to eq(10)
        expect(response).to redirect_to(cart_path(cart_item.cart))
        expect(flash[:notice]).to eq 'Quantity updated'
      end
    end

    context 'with invalid attributes' do
      it 'does not update the cart item and renders edit' do
        patch :update, params: { cart_id: cart.id, id: cart_item.id, cart_item: { quantity: nil } }
        cart_item.reload

        expect(cart_item.quantity).not_to eq(nil)
        expect(flash[:alert]).to eq 'Something went wrong'
      end
    end
  end
end
