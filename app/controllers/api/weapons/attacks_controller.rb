class Api::Weapons::AttacksController < ApplicationController
	def create
		@attack = WeaponAttack.new(attack_params)
		@attack.weapon_id = params[:weapon_id]
		if @attack.save
			render json: @attack, status: :created
		else
			render json: { errors: @attack.errors.full_messages }, status: 500
		end
	end

	def update 
		@attack = WeaponAttack.find(params[:id])
		if @attack.update(attack_params)
			render json: @attack, status: :ok
		else
			render json: { errors: @attack.errors.full_messages }, status: 500
		end
	end

	def destroy
		@attack = WeaponAttack.find(params[:id])
		@attack.destroy
		head :no_content
	end
	
	private 

	def attack_params 
		params.require(:attack).permit(:name, :level)
	end

end
