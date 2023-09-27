class Api::WeaponsController < ApplicationController
	def index
		@weapons = Weapon.all.order(:category,:name)
		render json: @weapons, status: :ok
	end

	def create 
		@weapon = Weapon.new(weapon_params)
		if @weapon.save
			render json: @weapon, status: :created
		else
			render json: { errors: @weapon.errors.full_messages }, status: 500
		end
	end

	def show 
		@weapon = Weapon.find(params[:id])
		render json: @weapon, include: [:attacks, :guards, :passives, :requirements, :scalings], status: :ok
	end

	def update
		@weapon = Weapon.find(params[:id])
		if @weapon.update(weapon_params)
			render json: @weapon, status: :ok
		else
			render json: { errors: @weapon.errors.full_messages }, status: 500
		end
	end

	def destroy
		@weapon = Weapon.find(params[:id])
		@weapon.destroy
		head :no_content
	end

	private 

	def weapon_params
		params.require(:weapon).permit(:name, :description, :category) 
	end
end
