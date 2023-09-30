Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	namespace :api do
		resources :cook_books do 
			resources :recipes, only: [:create,:destroy], controller: 'cook_books/recipes'
			collection do 
				get 'json_seed'
			end
		end
		resources :recipes do
			resources :materials, only: [:create,:update,:destroy], controller: 'recipes/materials'
			collection do 
				get 'json_seed'
			end
		end
		resources :materials
		resources :weapons do
			resources :attacks, only: [:create,:update,:destroy], controller: 'weapons/attacks' 
			resources :guards, only: [:create,:update,:destroy], controller: 'weapons/guards'
			resources :passives, only: [:create,:update,:destroy], controller: 'weapons/passives'
			resources :requirements, only: [:create,:update,:destroy], controller: 'weapons/requirements'
			resources :scalings, only: [:create,:update,:destroy], controller: 'weapons/scalings'
		end
	end
end
