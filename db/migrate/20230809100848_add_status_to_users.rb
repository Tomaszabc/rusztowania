# frozen_string_literal: true

class AddStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :string, default: 'scaffolder'
  end
end
