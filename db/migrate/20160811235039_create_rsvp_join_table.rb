class CreateRsvpJoinTable < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.references :user, index: true, unsigned: true
      t.references :event, index: true, unsigned: true
      t.references :penalty, index: true, unsigned: true
    	t.integer :num_guests, limit: 1, unsigned: true
    	t.integer :rsvp, limit: 1, unsigned: true
      t.timestamps null: false
      # t.index [:event_id, :user_id]
      t.index [:user_id, :event_id], unique: true
    end
  end
end
