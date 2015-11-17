class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :manager
      t.string :open_at
      t.string :close_at

      t.timestamps null: false
    end
  end
end
