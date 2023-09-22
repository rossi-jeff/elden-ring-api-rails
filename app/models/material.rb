class Material < ApplicationRecord
	self.inheritance_column = nil
	enum type: { consumable: 0, projectile: 1, medicine: 2, resistance: 3, damage_negation: 4, grease: 5, runes: 6, multiplayer: 7, crafting: 8 }

	has_many :recipe_materials, dependent: :destroy
	has_many :recipes, through: :recipe_materials
end
