# frozen_string_literal: true

class CreatePartCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :part_categories do |t|
      t.references :part, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
