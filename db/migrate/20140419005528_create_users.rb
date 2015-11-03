class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.string :gender
      t.string :type_user
      t.references :neighborhood
      t.string :email
      t.string :username
      t.string :password

      t.timestamps
    end
    add_index :users, :neighborhood_id
  end
end
