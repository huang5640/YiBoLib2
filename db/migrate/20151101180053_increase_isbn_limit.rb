class IncreaseIsbnLimit < ActiveRecord::Migration
  def change
  	change_column :books, :ISBN, :integer, :limit => 13
  end
end
