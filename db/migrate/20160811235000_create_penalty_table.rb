class CreatePenaltyTable < ActiveRecord::Migration
  def change
    create_table :penalties do |t|
      t.integer :kind, limit: 1, unsigned: true
      t.timestamps null: false
    end
  end
end
