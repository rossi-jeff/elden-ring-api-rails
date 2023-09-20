class Api::Recipes::MaterialsController < ApplicationController
	def create 
		@recipe_material = RecipeMaterial.new(create_params)
		if @recipe_material.save
			render json: @recipe_material, include: [:material], status: :created
		else
			render json: { errors: @recipe_material.errors.full_messages }, status: 500
		end
	end

	def update
		@recipe_material = RecipeMaterial.find(params[:id])
		if @recipe_material.update(update_params)
			render json: @recipe_material, include: [:material], status: :ok
		else
			render json: { errors: @recipe_material.errors.full_messages }, status: 500
		end
	end

	def destroy
		@recipe_material = RecipeMaterial.find(params[:id])
		@recipe_material.destroy
		head :no_content
	end

	private

	def create_params
		params.permit(:recipe_id, :material_id, :quantity)
	end

	def update_params
		params.permit(:quantity)
	end
end
