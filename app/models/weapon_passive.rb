class WeaponPassive < ApplicationRecord
	enum name: { bleed: 0, frost: 1, poison: 2, rot: 3}
  belongs_to :weapon
end
