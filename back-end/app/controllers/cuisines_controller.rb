class CuisinesController < ApplicationController
	skip_before_filter :verify_authenticity_token  # skip verifying the authenticity token
	def index
		cuisines = Cuisine.all
	    render json: cuisines
	end

  	def create
    	cuisine = Cuisine.create(name: params[:cuisine][:name],
                   description: params[:cuisine][:description])
    	render json: cuisine
  	end

	def destroy
		cuisine = Cuisine.destroy(params[:id])
		render json: cuisine
	end

	def show
		cuisine = Cuisine.find(params[:id])
		render json: cuisine
	end

	def update
    	cuisine = Cuisine.find(params[:id])
    	cuisine.update(name: params[:cuisine][:name], description: params[:cuisine][:description])
    	render json: cuisine
  end
end
