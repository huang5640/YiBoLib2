class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.integer :ISBN
      t.string :image
      t.integer :YiBoNum
      t.string :keywords
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
