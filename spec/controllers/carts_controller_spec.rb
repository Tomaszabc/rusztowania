require "rails_helper"

RSpec.describe CartsController, type: :controller do
  let(:cart) { create(:cart) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET #show" do
    let!(:cart_items) { create_list(:cart_item, 3, cart: cart) }

    it "assigns @cart and @cart_items" do
      get :show, params: {id: cart.id}
      expect(assigns(:cart)).to eq(cart)
      expect(assigns(:cart_items)).to match_array(cart_items)
    end

    it "calculates total weight" do
      get :show, params: {id: cart.id}
      total_weight = cart_items.sum { |item| item.part.weight * item.quantity }
      expect(assigns(:total_weight)).to eq(total_weight)
    end
  end

  describe "POST #clear_cart" do
    let!(:cart_items) { create_list(:cart_item, 3, cart: cart) }

    it "clears all cart items and redirects" do
      expect {
        post :clear_cart, params: {id: cart.id}
      }.to change(CartItem, :count).by(-3)
      expect(response).to redirect_to(cart_path(cart))
      expect(flash[:notice]).to eq "Cart deleted !"
    end
  end
end
