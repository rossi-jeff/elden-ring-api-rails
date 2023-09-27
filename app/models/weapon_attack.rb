class WeaponAttack < ApplicationRecord
	enum name: { physical: 0, magic: 1, fire: 2, lightning: 3, holy: 4, critical: 5}
	belongs_to :weapon
end
