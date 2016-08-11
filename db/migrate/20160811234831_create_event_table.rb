class CreateEventTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location, null: false
      t.datetime :start, null: false
      t.datetime :end
      t.timestamps null: false
    end
  end
end
