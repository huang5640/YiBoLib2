class CreateBooksCheckings < ActiveRecord::Migration
  def change
    create_table :books_checkings do |t|
    	t.integer :book_id
    	t.integer :checking_id
    end
  end
end
