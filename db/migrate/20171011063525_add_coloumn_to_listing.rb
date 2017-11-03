class AddColoumnToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :service_type, :string
  end
end
