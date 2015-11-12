class AddUsertypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userType, :string
  end
end
