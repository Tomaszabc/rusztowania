require 'rails_helper'

RSpec.describe 'Admin Printing PDF', type: :system do
  before do
    driven_by(:selenium_chrome)
  end

  it 'logs in as an admin and prints an order' do
    # Przygotuj dane testowe
    admin_user = FactoryBot.create(:admin_user)
    order = FactoryBot.create(:order)

    # Odwiedź stronę logowania admina
    visit new_admin_user_session_path

    # Wprowadź dane logowania
    fill_in 'Email', with: admin_user.email
    fill_in 'Password', with: admin_user.password
    click_button 'Login'

    # Przejdź do konkretnego zamówienia
    visit admin_order_path(order)

    # Kliknij przycisk drukowania (załóżmy, że jest linkiem)
    click_link 'Print this Order'

    # Sprawdź czy odpowiedź to PDF (opcjonalnie)
    # expect(page.response_headers['Content-Type']).to include('application/pdf')

    # Dodatkowe asercje, jeśli to konieczne
  end
end

