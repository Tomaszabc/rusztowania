# frozen_string_literal: true

class RemoveImageFromParts < ActiveRecord::Migration[7.0]
  def change
    remove_column :parts, :image, :string
  end
end
