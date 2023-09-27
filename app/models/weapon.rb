class Weapon < ApplicationRecord
	enum category: { 
		daggers: 0, 
		straight_swords: 1, 
		great_swords: 2, 
		colossol_swords: 3, 
		thrusting_swords: 4, 
		heavy_thrusting_swords: 5, 
		curved_swords: 6, 
		curved_great_swords: 7, 
		katanas: 8,
		twin_blades: 9,
		axes: 10,
		great_axes: 11,
		hammers: 12,
		flails: 13,
		great_hammers: 14,
		colossal_weapons: 15,
		spears: 16,
		great_spears: 17,
		halberds: 18,
		reapers: 19,
		whips: 20,
		fists: 21,
		claws: 22,
		light_bows: 23,
		bows: 24,
		great_bows: 25,
		crossbows: 26,
		ballistas: 27,
		glintstone_staffs: 28,
		sacred_seals: 29,
		torches: 30,
		tools: 31
	}
	has_many :attacks, class_name: 'WeaponAttack', dependent: :destroy
	has_many :guards, class_name: 'WeaponGuard', dependent: :destroy
	has_many :passives, class_name: 'WeaponPassive', dependent: :destroy
	has_many :requirements, class_name: 'WeaponRequirement', dependent: :destroy
	has_many :scalings, class_name: 'WeaponScaling', dependent: :destroy
end
