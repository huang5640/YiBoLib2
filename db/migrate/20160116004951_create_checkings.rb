class CreateCheckings < ActiveRecord::Migration
  def change
    create_table :checkings do |t|

      t.timestamps null: false
    end
  end
end
