require "rails_helper"

RSpec.describe Warehouse::StoragesController, type: :controller do
  # Ustawianie danych testowych
  let!(:order) { create(:order) }
  let(:user) { create(:user) }

  describe "GET #print" do
    before do
      sign_in user
    end

    it "generates a PDF" do
      get :print, params: {id: order.id}

      expect(response.content_type).to eq("application/pdf")
      expect(response.body).to start_with("%PDF")
      expect(response).to have_http_status(:success)
    end
  end
end
