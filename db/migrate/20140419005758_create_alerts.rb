class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :description
      t.references :user
      t.references :neighborhood

      t.timestamps
    end
    add_index :alerts, :user_id
    add_index :alerts, :neighborhood_id
  end
end
