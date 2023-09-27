class WeaponScaling < ApplicationRecord
	enum name: { strength: 0, dexterity: 1, intelligence: 2, faith: 3, arcane: 4 }
	enum level: { S: 0, A: 1, B: 2, C: 3, D: 4, E: 5 }
	belongs_to :weapon
end
