class WeaponRequirement < ApplicationRecord
	enum name: { strength: 0, dexterity: 1, intelligence: 2, faith: 3, arcane: 4 }
  belongs_to :weapon
end
