class Api::Weapons::PassivesController < ApplicationController
	def create 
		@passive = WeaponPassive.new(passive_params)
		@passive.weapon_id = params[:weapon_id]
		if @passive.save
			render json: @passive, status: :created
		else
			render json: { errors: @passive.errors.full_messages }, status: 500
		end
	end

	def update 
		@passive = WeaponPassive.find(params[:id])
		if @passive.update(passive_params)
			render json: @passive, status: :ok
		else
			render json: { errors: @passive.errors.full_messages }, status: 500
		end
	end

	def destroy 
		@passive = WeaponPassive.find(params[:id])
		@passive.destroy
		head :no_content
	end

	private 

	def passive_params
		params.require(:passive).permit(:name, :level) 
	end
end
