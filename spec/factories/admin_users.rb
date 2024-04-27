FactoryBot.define do
  factory :admin_user, class: "AdminUser" do
    email { Faker::Internet.unique.email }
    password { "password" }
    # Dodaj inne atrybuty specyficzne dla admina, jeśli są potrzebne
  end
end
