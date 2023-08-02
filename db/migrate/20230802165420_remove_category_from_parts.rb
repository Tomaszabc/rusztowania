class RemoveCategoryFromParts < ActiveRecord::Migration[7.0]
  def change
    remove_column :parts, :category, :string
  end
end
