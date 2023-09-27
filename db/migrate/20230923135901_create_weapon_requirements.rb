class CreateWeaponRequirements < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_requirements do |t|
      t.references :weapon, null: false, foreign_key: true
      t.integer :name
      t.integer :level

      t.timestamps
    end
  end
end
