# frozen_string_literal: true

class AddDeletedAtToSystem < ActiveRecord::Migration[7.0]
  def change
    add_column :systems, :deleted_at, :datetime
    add_index :systems, :deleted_at
  end
end
