class AddLocationToBook < ActiveRecord::Migration
  def change
    add_column :books, :location, :integer
  end
end
