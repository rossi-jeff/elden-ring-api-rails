class NameCharLimit < ActiveRecord::Migration[7.0]
  def change
		change_column :materials, :name, :string, :limit => 100
		change_column :recipes, :name, :string, :limit => 100
		change_column :cook_books, :name, :string, :limit => 100
		change_column :weapons, :name, :string, :limit => 100
  end
end
