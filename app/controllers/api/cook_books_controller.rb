class Api::CookBooksController < ApplicationController
	def index
		@cook_books = CookBook.all.order(:name)
		render json: @cook_books, status: :ok
	end

	def json_seed
		output = []
		@cook_books = CookBook.all.order(:name)
		@cook_books.each do |cb|
			obj = {}
			obj['name'] = cb.name
			obj['description'] = cb.description
			obj['recipes'] = []
			recipes = CookBookRecipe.where(cook_book_id: cb.id).joins(:recipe)
			recipes.each do |rcp|
				obj['recipes'] << rcp.recipe.name if rcp.recipe
			end
			output << obj
		end
		render json: output, status: :ok
	end

	def create 
		@cook_book = CookBook.new(cook_book_params)
		if @cook_book.save
			render json: @cook_book, status: :created
		else
			render json: { errors: @cook_book.errors.full_messages }, status: 500
		end
	end

	def show 
		@cook_book = CookBook.find(params[:id])
		render json: @cook_book, include: [:cook_book_recipes => {include: [:recipe]}], status: :ok
	end

	def update
		@cook_book = CookBook.find(params[:id])
		if @cook_book.update(cook_book_params)
			render json: @cook_book, status: :ok
		else
			render json: { errors: @cook_book.errors.full_messages }, status: 500
		end
	end

	def destroy
		@cook_book = CookBook.find(params[:id])
		@cook_book.destroy
		head :no_content
	end

	private 

	def cook_book_params
		params.require(:cook_book).permit(:name, :description) 
	end
end
