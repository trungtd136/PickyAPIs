class RestaurantController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
  	@restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  	# restaurant = Restaurant.find(params[:id])
  	render status: 200, json: @restaurant
  end

  # GET /restaurants/new
  def new
  	@restaurant = Restaurant.new
    render status: 200, json: @restaurant
  end

  # GET /restaurants/1/edit
  def edit
  	
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
  	@restaurant = Restaurant.new(restaurant_params)

  	respond_to do |format|
      if @restaurant.save
        format.json { render action: 'show', status: :create, location: @restaurant }
      else
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
  	@restaurant.destroy

  	respond_to do |format|
  		restaurants = Restaurant.all
  		format.json { render json: restaurants}
  	end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :address, :contact, :web_url, :raiting)
  end
end