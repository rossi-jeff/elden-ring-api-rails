class Api::Weapons::RequirementsController < ApplicationController
	def create 
		@requirement = WeaponRequirement.new(requirement_params)
		@requirement.weapon_id = params[:weapon_id]
		if @requirement.save
			render json: @requirement, status: :created
		else
			render json: { errors: @requirement.errors.full_messages }, status: 500
		end
	end

	def update 
		@requirement = WeaponRequirement.find(params[:id])
		if @requirement.update(requirement_params)
			render json: @requirement, status: :ok
		else
			render json: { errors: @requirement.errors.full_messages }, status: 500
		end
	end

	def destroy 
		@requirement = WeaponRequirement.find(params[:id])
		@requirement.destroy
		head :no_content
	end

	private 

	def requirement_params
		params.require(:requirement).permit(:name, :level) 
	end
end
