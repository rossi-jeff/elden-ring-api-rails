class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.integer :price, default: 0
      t.integer :type, default: 0

      t.timestamps
    end
  end
end
