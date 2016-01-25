class AddStatusToChecking < ActiveRecord::Migration
  def change
  	 add_column :checkings, :status, :string
  end
end
