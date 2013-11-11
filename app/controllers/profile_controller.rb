class ProfileController < ApplicationController

  # http_basic_authenticate_with name: "admin", password: "secret";

  skip_before_filter :verify_authenticity_token
  # before_filter :restrict_access  
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # -------------------------------------------
  # => TODO-RESTAURANT APIs
  # -------------------------------------------
  # GET /profiles/1/get_todos 
  def get_todo_restaurants
    @profile = Profile.find(params[:id])
    @restaurants = @profile.todos

    render status: 200, json: @restaurants
  end

  # POST /profiles/1/add_todo
  def add_todo    
    @profile = Profile.find(params[:id])
    @todo = @profile.todo_restaurants.build(todo_params)

    if @todo.save
      render status: 200, json: @profile.todos
    else
      render status: 404, json: {errors: "Couldn't add todo restaurant, Itt's exists}"}
    end
  end

  # DELETE /profiles/1/done_todo
  def done_todo    

    @profile = Profile.find(params[:id]) 

    @todo = @profile.get_todo_with_restaurant_id(params[:restaurant_id])

    p "-------------"
    p "profile_id = #{@todo.profile_id}"
    p "restaurant_id = #{@todo.restaurant_id}"
    p "status = #{@todo.status}"
    p "-------------"
    
    unless @todo.nil?      

      TodoRestaurant.delete_all(profile_id: @todo.profile_id, restaurant_id: @todo.restaurant_id)

      render status: 200, json: @profile.todos

    else
      render status: 404, json: {errors: "Couldn't find todo with restaurant_id #{params[:restaurant_id]}"}
    end
  end

  # -------------------------------------------
  # => FAVOURITE-RESTAURANT APIs
  # -------------------------------------------
  # GET /profiles/1/get_favourites 
  def get_favourite_restaurants
    @profile = Profile.find(params[:id])
    @restaurants = @profile.favourites

    render status: 200, json: @restaurants
  end

  # POST /profiles/1/add_favourite
  def add_favourite
    @profile = Profile.find(params[:id])
    @favourite = @profile.favourite_restaurants.build(favourite_params)

    if @favourite.save
      render status: 200, json: @profile.favourites
    else
      render status: 404, json: {errors: "Couldn't add favourite restaurant, Itt's exists}"}
    end
  end

  # DELETE /profiles/1/remove_favourite
  def remove_favourite   

    @profile = Profile.find(params[:id]) 

    @favourite = @profile.get_favourite_with_restaurant_id(params[:restaurant_id])

    p "-------------"
    p "profile_id = #{@favourite.profile_id}"
    p "restaurant_id = #{@favourite.restaurant_id}"
    p "status = #{@favourite.status}"
    p "-------------"
    
    unless @favourite.nil?      

      FavouriteRestaurant.delete_all(profile_id: @favourite.profile_id, restaurant_id: @favourite.restaurant_id)

      render status: 200, json: @profile.favourites

    else
      render status: 404, json: {errors: "Couldn't find favourite with restaurant_id #{params[:restaurant_id]}"}
    end
  end

  # -------------------------------------------
  # => PROFILE APIs
  # -------------------------------------------
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    profile = Profile.find(params[:id])
    render status: 200, json: profile
  end

  # GET /profiles/new
  def new
 	@profile = Profile.new
    render status: 200, json: @profile
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
  	@profile = Profile.new(profile_params)

  	respond_to do |format|
      if @profile.save
        UserMailer.delay.registration_confirmation(@profile)
        format.json { render action: 'show', status: :create, location: @profile }
      else
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
  	@profile.destroy

  	respond_to do |format|
  		profiles = Profile.all
  		format.json { render json: profiles}
  	end
  end

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end

  # def restrict_access
  #   authenticate_or_request_with_http_token do |token, options|
  #     ApiKey.exists?(access_token: token)
  #   end
  # end


  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:name, :email, :profile_icon)
  end

  def todo_params
    params.require(:todo).permit(:status, :profile_id, :restaurant_id)
  end

  def favourite_params
    params.require(:favourite).permit(:status, :profile_id, :restaurant_id)
  end
  
end