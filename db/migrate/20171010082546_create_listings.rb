class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :plan_title
      t.text :plan_detail
      t.string :shop_info
      t.integer :acceptable
      t.integer :plan_time
      t.text :guide_detail
      t.text :cancel_policy
      t.text :capacity
      t.string :nationality
      t.string :language
      t.string :language_level
      t.integer :age
      t.string :sex
      t.integer :price_setting
      t.text :favorite_topic
      t.string :residentcountry
      t.string :residentcity
      t.float :latitude
      t.float :longitude
      t.text :my_goal
      t.string :address
      t.text :myprofile

      t.timestamps
    end
  end
end
