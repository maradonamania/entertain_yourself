class CreateSupplements < ActiveRecord::Migration[6.0]
  def change
    create_table :supplements do |t|
      t.text :description,          null: false
      t.references :user,           null: false,foreign_key: true
      t.references :plan,           null:false,foreign_key: true
      t.integer :location_id,       null:false
      t.integer :genre_id,          null:false
      t.timestamps
    end
  end
end
