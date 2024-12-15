# frozen_string_literal: true

class RemoveCategoryFromParts < ActiveRecord::Migration[7.0]
  def change
    remove_column :parts, :category, :string if column_exists?(:parts, :category)
  end
end
