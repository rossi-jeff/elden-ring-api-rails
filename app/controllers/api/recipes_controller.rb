class Api::RecipesController < ApplicationController
	def index
		@recipes = Recipe.all.order(:name)
		# .left_joins(:recipe_materials,:materials).select('recipes.name,recipes.description,recipes.type,recipe_materials.quantity,materials.name as material_name')
		render json: @recipes, status: :ok
	end

	def json_seed
		output = []
		@recipes = Recipe.all.order(:name)
		@recipes.each do |recipe|
			obj = {}
			obj['name'] = recipe.name
			obj['description'] = recipe.description
			obj['materials'] = []
			materials = RecipeMaterial.where(recipe_id: recipe.id).joins(:material)
			materials.each do |mat|
				child = {}
				child['quantity'] = mat.quantity
				child['name'] = mat.material.name
				obj['materials'] << child
			end
			output << obj
		end
		render json: output, status: :ok
	end


	def create 
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			render json: @recipe, status: :created
		else
			render json: { errors: @recipe.errors.full_messages }, status: 500
		end
	end

	def show 
		@recipe = Recipe.find(params[:id])
		render json: @recipe, include: [:recipe_materials => {include: [:material]}], status: :ok
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			render json: @recipe, status: :ok
		else 
			render json: { errors: @recipe.errors.full_messages }, status: 500
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		head :no_content
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :description, :price, :type)
	end
end
