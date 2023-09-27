class Api::Weapons::ScalingsController < ApplicationController
	def create 
		@scaling = WeaponScaling.new(scaling_params)
		@scaling.weapon_id = params[:weapon_id]
		if @scaling.save
			render json: @scaling, status: :created
		else
			render json: { errors: @scaling.errors.full_messages }, status: 500
		end
	end

	def update 
		@scaling = WeaponScaling.find(params[:id])
		if @scaling.update(scaling_params)
			render json: @scaling, status: :ok
		else
			render json: { errors: @scaling.errors.full_messages }, status: 500
		end
	end

	def destroy
		@scaling = WeaponScaling.find(params[:id])
		@scaling.destroy
		head :no_content
	end

	private

	def scaling_params
		params.require(:scaling).permit(:name, :level) 
	end
end
