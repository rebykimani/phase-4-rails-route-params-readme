class CheesesController < ApplicationController

  def index
    cheeses = Cheese.all
    render json: cheeses, only: [:id, :name, :price, :is_best_seller], methods: [:summary] 
  end
  def show
      cheese = Cheese.find_by(params[:id])
      if cheese
        render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
      else 
        render json: {error: "Cheese not found"}, status: :not_found
      end
      end
end
