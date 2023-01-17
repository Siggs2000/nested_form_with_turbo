class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :current_boat
      t.string :authentication_token

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :authentication_token, unique: true
  end
end
