# frozen_string_literal: true

class CreateDeliveryEmail < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_emails do |t|
      t.string :recipient_email
      t.timestamps
    end
  end
end
