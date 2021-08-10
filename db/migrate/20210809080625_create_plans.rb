class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.references :user,          null: false,foreign_key: true
      t.text :name,                null: false
      t.text :description,         null: false
      t.integer :genre_id,         null: false
      t.integer :budget_id,        null: false
      t.integer :location_id,      null: false
      t.integer :expected_time_id,          null: false
      t.timestamps
    end
  end
end
