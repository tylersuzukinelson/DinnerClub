class MoveColumnFromRsvpToPenalty < ActiveRecord::Migration
  def up
    remove_column :rsvps, :penalty_id
    add_reference :penalties, :rsvp, index: :true, unsigned: true
  end

  def down
    add_reference :rsvps, :penalty, index: true, unsigned: true
    remove_column :penalties, :rsvp_id
  end
end
