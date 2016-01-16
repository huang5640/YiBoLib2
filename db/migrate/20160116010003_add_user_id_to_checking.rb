class AddUserIdToChecking < ActiveRecord::Migration
  def change
  	add_column :checkings, :user_id, :integer
  end
end
