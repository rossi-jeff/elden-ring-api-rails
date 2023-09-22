class Recipe < ApplicationRecord
	self.inheritance_column = nil
	enum type: { consumable: 0, projectile: 1, medicine: 2, resistance: 3, damage_negation: 4, grease: 5, runes: 6, multiplayer: 7 }

	has_many :recipe_materials, dependent: :destroy
	has_many :cook_book_recipes, dependent: :destroy
	has_many :materials, through: :recipe_materials
	has_many :cook_books, through: :cook_book_recipes
end
