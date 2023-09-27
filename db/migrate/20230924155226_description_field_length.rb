class DescriptionFieldLength < ActiveRecord::Migration[7.0]
  def up
		change_column :materials, :description, :text, :limit => 500
		change_column :recipes, :description, :text, :limit => 500
		change_column :cook_books, :description, :text, :limit => 500
		change_column :weapons, :description, :text, :limit => 1000
  end

	def down
		change_column :materials, :description, :string
		change_column :recipes, :description, :string
		change_column :cook_books, :description, :string
		change_column :weapons, :description, :string
	end
end
