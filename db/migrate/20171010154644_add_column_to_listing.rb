class AddColumnToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :active, :boolean
    add_reference :listings, :user, foreign_key: true
  end
end
