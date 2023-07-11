class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :description
      t.decimal :weight
      t.string :system
      t.string :category
      t.integer :multipack
      t.string :image

      t.timestamps
    end
  end
end
