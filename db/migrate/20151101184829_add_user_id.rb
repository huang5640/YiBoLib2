class AddUserId < ActiveRecord::Migration
  def change
  	add_column :book, :user_id, :integer
  end
end
