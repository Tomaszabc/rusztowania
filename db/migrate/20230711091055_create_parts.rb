# frozen_string_literal: true

class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :description
      t.decimal :weight

      t.integer :multipack
      t.string :image

      t.timestamps
    end
  end
end
