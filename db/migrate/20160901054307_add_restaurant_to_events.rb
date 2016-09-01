class AddRestaurantToEvents < ActiveRecord::Migration
  def up
    add_reference :events, :restaurant, index: true
    add_foreign_key :events, :restaurants
    remove_column :events, :location
  end

  def down
    remove_column :events, :restaurant_id
    add_column :events, :location, :string
  end
end
