class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :title
      t.string :address
      t.string :url

      t.timestamps null: false
    end
  end
end
