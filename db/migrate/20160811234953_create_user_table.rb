class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.boolean :admin, null: false, default: false
      t.boolean :enabled, null: false, default: false
      t.timestamps null: false
    end
  end
end
