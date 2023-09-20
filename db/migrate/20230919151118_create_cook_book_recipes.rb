class CreateCookBookRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :cook_book_recipes do |t|
      t.references :cook_book, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
