class AddBookIdToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_id, :string
  end
end
