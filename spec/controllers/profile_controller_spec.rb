require 'spec_helper'

describe ProfileController do

  let(:valid_attributes) { {"name" => "abc", "email" => "abc@gmail.com"} }

  # -------------------------------------------
  # => TODO-RESTAURANT APIs
  # -------------------------------------------
  describe "GET #todos" do
    it "populates an array of restaurants" do
      
      restaurant = create(:restaurant)
      profile = create(:profile)

      todo = profile.todo_restaurants.create(restaurant_id: restaurant.id, status: 1)

      get :get_todo_restaurants, {id: profile.to_param}
      assigns(:restaurants).should eq([restaurant])
    end
  end

  describe "POST #add_todo" do
    it "saves the new todo_restaurant in the database" do
        expect {

          profile = create(:profile)

          post :add_todo, { id: profile.to_param, :todo => {"status" => 1, "restaurant_id" => 1}  }
        }.to change(TodoRestaurant, :count).by(1)

      end
      
      it "assigns a newly created todo_restaurant as @todo" do
        profile = create(:profile)
        post :add_todo, { id: profile.to_param, :todo => {"status" => 1, "restaurant_id" => 1}  }
        assigns(:todo).should be_a(TodoRestaurant)
        assigns(:todo).should be_persisted
      end
  end

  describe "DELETE #done_todo" do
    it "deletes the todo_restaurant" do 
      
      restaurant = create(:restaurant)
      profile = create(:profile)
      todo = profile.todo_restaurants.create(restaurant_id: restaurant.id, status: 1)

      expect{ 
        delete :done_todo, {:id => profile.to_param, :restaurant_id => restaurant.to_param}
      }.to change(TodoRestaurant,:count).by(-1) 
    end 
  end

  # -------------------------------------------
  # => FAVOURITE-RESTAURANT APIs
  # -------------------------------------------
  describe "GET #favourites" do
    it "populates an array of restaurants" do
      
      restaurant = create(:restaurant)
      profile = create(:profile)

      favourite = profile.favourite_restaurants.create(restaurant_id: restaurant.id, status: 1)

      get :get_favourite_restaurants, {id: profile.to_param}
      assigns(:restaurants).should eq([restaurant])
    end
  end

  describe "POST #add_favourite" do
    it "saves the new favourite_restaurant in the database" do
        expect {

          profile = create(:profile)

          post :add_favourite, { id: profile.to_param, :favourite => {"status" => 1, "restaurant_id" => 1}  }
        }.to change(FavouriteRestaurant, :count).by(1)

      end
      
      it "assigns a newly created favourite_restaurant as @favourite" do
        profile = create(:profile)
        post :add_favourite, { id: profile.to_param, :favourite => {"status" => 1, "restaurant_id" => 1}  }
        assigns(:favourite).should be_a(FavouriteRestaurant)
        assigns(:favourite).should be_persisted
      end
  end

  describe "DELETE #remove_favourite" do
    it "deletes the favourite_restaurant" do 
      
      restaurant = create(:restaurant)
      profile = create(:profile)
      favourite = profile.favourite_restaurants.create(restaurant_id: restaurant.id, status: 1)

      expect{ 
        delete :remove_favourite, {:id => profile.to_param, :restaurant_id => restaurant.to_param}
      }.to change(FavouriteRestaurant,:count).by(-1) 
    end 
  end

  # -------------------------------------------
  # => PROFILE APIs
  # -------------------------------------------
  describe "GET #index" do
    it "populates an array of profiles" do
      profile = create(:profile)

      get :index, {format: :json}
      assigns(:profiles).should eq([profile])
    end

    it "renders the :index view" do
      # TODO
      # get :index 
      # response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested profile to @profile" do
      profile = create(:profile)

      get :show, {id: profile.to_param}, {format: :json}
      assigns(:profile).should eq(profile)
    end

    it "renders the :show template" do
      # TODO
      # profile = create(:profile)
      # get :show, {id: profile.to_param}, {format: :json}
      # response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Profile to @profile" do
      get :new, {format: :json}

      assigns(:profile).should be_a_new(Profile)
    end

    it "renders the :new template" do
      # TODO
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new profile in the database" do
      	expect {
          post :create, {:profile => valid_attributes, format: :json }
        }.to change(Profile, :count).by(1)
      end
      
      it "assigns a newly created profile as @profile" do
        post :create, {:profile => valid_attributes, format: :json }
        assigns(:profile).should be_a(Profile)
        assigns(:profile).should be_persisted
      end

      it "redirects to the home page"
    end

    context "with invalid attributes" do

      it "assigns a newly created but unsaved profile as @profile" do
        #Trigger the behavior that occurs when invalid params are submitted
        Profile.any_instance.stub(:save).and_return(false)

        post :create, {:profile => {"name" => "invalid value" }, format: :json }
        response.should_not be_success
        assigns(:profile).should_not be_persisted
      end

      it "the paramater name is nil" do
        post :create, {profile: {name: nil}, format: :json }
        response.should_not be_success
        assigns(:profile).should be_a_new(Profile)
      end

    end
  end

  describe 'DELETE destroy' do 

  	before :each do 
  		profile = create(:profile)
  	end 

  	it "deletes the profile" do 
  		profile = Profile.create! valid_attributes
  		expect{ 
  			delete :destroy, {:id => profile.to_param, format: :json }
  		}.to change(Profile,:count).by(-1) 
  	end 

  	it "redirects to profile#index" do 
  		# delete :destroy, id: @profile response.should redirect_to profiles_url 
  	end 
  end

end