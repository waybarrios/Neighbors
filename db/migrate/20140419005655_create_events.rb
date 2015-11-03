class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date_event
      t.time :time_event
      t.string :place
      t.references :user
      t.references :neighborhood

      t.timestamps
    end
    add_index :events, :user_id
    add_index :events, :neighborhood_id
  end
end
