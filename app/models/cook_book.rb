class CookBook < ApplicationRecord
	has_many :cook_book_recipes, dependent: :destroy
	has_many :recipes, through: :cook_book_recipes
end
