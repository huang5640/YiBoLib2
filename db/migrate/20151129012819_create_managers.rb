class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :YiBoID
      t.string :authorization

      t.timestamps null: false
    end
  end
end
