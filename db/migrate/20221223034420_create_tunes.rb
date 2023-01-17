class CreateTunes < ActiveRecord::Migration[7.0]
  def change
    create_table :tunes do |t|
      t.integer :overall_rating

      t.timestamps
    end
    add_index :tunes, :overall_rating
  end
end
