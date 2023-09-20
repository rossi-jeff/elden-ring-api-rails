class CookBook < ApplicationRecord
	has_many :recipes, through: :cook_book_recipes
	has_many :cook_book_recipes, dependent: :destroy
end
