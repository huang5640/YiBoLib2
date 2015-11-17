class ChangeLoationToLocationId < ActiveRecord::Migration
  def change
    rename_column :books, :location, :location_id
  end
end
