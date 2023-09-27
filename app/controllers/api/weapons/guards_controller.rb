class Api::Weapons::GuardsController < ApplicationController
	def create 
		@guard = WeaponGuard.new(guard_params)
		@guard.weapon_id = params[:weapon_id]
		if @guard.save
			render json: @guard, status: :created
		else
			render json: { errors: @guard.errors.full_messages }, status: 500
		end
	end

	def update
		@guard = WeaponGuard.find(params[:id])
		if @guard.update(guard_params)
			render json: @guard, status: :ok
		else
			render json: { errors: @guard.errors.full_messages }, status: 500
		end
	end

	def destroy
		@guard = WeaponGuard.find(params[:id])
		@guard.destroy
		head :no_content
	end

	private 

	def guard_params
		params.require(:guard).permit(:name, :level) 
	end
end
