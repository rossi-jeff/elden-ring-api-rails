class Api::MaterialsController < ApplicationController
	def index
		@materials = Material.all.order(:name)
		render json: @materials, status: :ok
	end

	def create 
		@material = Material.new(material_params)
		if @material.save
			render json: @material, status: :created
		else
			render json: { errors: @material.errors.full_messages }, status: 500
		end
	end

	def show 
		@material = Material.find(params[:id])
		render json: @material, status: :ok
	end

	def update
		@material = Material.find(params[:id])
		if @material.update(material_params)
			render json: @material, status: :ok
		else
			render json: { errors: @material.errors.full_messages }, status: 500
		end
	end

	def destroy
		@material = Material.find(params[:id])
		@material.destroy
		head :no_content
	end

	private

	def material_params 
		params.require(:material).permit(:name, :description, :location, :price, :type)
	end
end
