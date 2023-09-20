Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	namespace :api do
		resources :cook_books do 
			resources :recipes, only: [:create,:destroy], controller: 'cook_books/recipes'
		end
		resources :recipes do
			resources :materials, only: [:create,:update,:destroy], controller: 'recipes/materials'
		end
		resources :materials
	end
end
