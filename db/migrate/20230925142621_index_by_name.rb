class IndexByName < ActiveRecord::Migration[7.0]
  def change
		add_index :materials, :name
		add_index :recipes, :name
		add_index :cook_books, :name
		add_index :weapons, :name
  end
end
