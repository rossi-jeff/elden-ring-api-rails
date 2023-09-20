class Material < ApplicationRecord
	enum type: { consumable: 0, projectile: 1, medicine: 2, resistance: 3, damage_negation: 4, grease: 5, runes: 6, multiplayer: 7 }

	has_many :recipes, through: :recipe_materials
	has_many :recipe_materials, dependent: :destroy
end
