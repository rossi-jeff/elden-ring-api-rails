class Api::WeaponsController < ApplicationController
	def index
		@weapons = Weapon.all.order(:category,:name)
		render json: @weapons, status: :ok
	end

	def json_seed 
		output = []
		@weapons = Weapon.all.order(:category,:name)
		@weapons.each do |w|
			obj = {}
			obj['name'] = w.name
			obj['description'] = w.description
			obj['attack'] = []
			w.attacks.each do |a|
				child = {}
				child['name'] = a.name
				child['level'] = a.level
				obj['attack'] << child
			end
			obj['guard'] = []
			w.guards.each do |g|
				child = {}
				child['name'] = g.name
				child['level'] = g.level
				obj['guard'] << child
			end
			obj['scaling'] = []
			w.scalings.each do |s|
				child = {}
				child['name'] = s.name
				child['level'] = s.level
				obj['scaling'] << child
			end
			obj['requirements'] = []
			w.requirements.each do |r|
				child = {}
				child['name'] = r.name
				child['level'] = r.level
				obj['requirements'] << child
			end
			obj['passive'] = []
			w.passives.each do |p|
				child = {}
				child['name'] = p.name
				child['level'] = p.level
				obj['passive'] << child
			end
			output << obj
		end
		render json: output, status: :ok
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
