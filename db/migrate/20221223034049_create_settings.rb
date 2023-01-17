class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.integer :tune_id
      t.string :name

      t.timestamps
    end
    add_index :settings, :tune_id
  end
end
