class Api::CookBooks::RecipesController < ApplicationController
	def create 
		@cook_book_recipe = CookBookRecipe.new(create_params)
		if @cook_book_recipe.save
			render json: @cook_book_recipe, include: [:recipe], status: :created
		else
			render json: { errors: @cook_book_recipe.errors.full_messages }, status: 500
		end
	end

	def destroy
		@cook_book_recipe = CookBookRecipe.find(params[:id])
		@cook_book_recipe.destroy
		head :no_content
	end

	private

	def create_params
		params.permit(:cook_book_id, :recipe_id)
	end
end
