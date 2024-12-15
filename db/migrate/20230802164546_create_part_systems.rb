# frozen_string_literal: true

class CreatePartSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :part_systems do |t|
      t.references :part, foreign_key: true
      t.references :system, foreign_key: true

      t.timestamps
    end
  end
end
