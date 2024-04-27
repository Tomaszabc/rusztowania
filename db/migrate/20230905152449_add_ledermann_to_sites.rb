class AddLedermannToSites < ActiveRecord::Migration[7.0]
  def change
    add_reference :sites, :ledermann, foreign_key: {to_table: :users}
  end
end
