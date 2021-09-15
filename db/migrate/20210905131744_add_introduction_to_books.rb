class AddIntroductionToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :introduction, :string
  end
end
