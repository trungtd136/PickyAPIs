require 'spec_helper'

describe RestaurantController do

  let(:valid_attributes) { {"name" => "abc", "cuisine" => "MyString", "address" => "MyString", "contact" => "MyString", "web_url" => "MyString", "raiting" => 1.5} }

  describe "GET #index" do
    it "populates an array of restaurants" do
      restaurant = create(:restaurant)

      get :index, {format: :json}
      assigns(:restaurants).should eq([restaurant])
    end

    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested restaurant to @restaurant" do
      restaurant = create(:restaurant)

      get :show, {id: restaurant.to_param}, {format: :json}
      assigns(:restaurant).should eq(restaurant)
    end

    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Restaurant to @restaurant" do
      get :new, {format: :json}

      assigns(:restaurant).should be_a_new(Restaurant)
    end
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new restaurant in the database" do
        expect {
          post :create, {:restaurant => valid_attributes, format: :json }
        }.to change(Restaurant, :count).by(1)
      end

      it "assigns a newly created restaurant as @restaurant" do
        post :create, {:restaurant => valid_attributes, format: :json }
        assigns(:restaurant).should be_a(Restaurant)
        assigns(:restaurant).should be_persisted
      end

      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "assigns a newly created but unsaved restaurant as @restaurant" do
        #Trigger the behavior that occurs when invalid params are submitted
        Restaurant.any_instance.stub(:save).and_return(false)

        post :create, {:restaurant => {"name" => "invalid value" }, format: :json }
        response.should_not be_success
        assigns(:restaurant).should_not be_persisted
      end

      it "the paramater name is nil" do
        post :create, {restaurant: {name: nil}, format: :json }
        response.should_not be_success
        assigns(:restaurant).should be_a_new(Restaurant)
      end
    end
  end

   describe 'DELETE destroy' do 

    before :each do 
      restaurant = create(:restaurant)
    end 

    it "deletes the restaurant" do 
      restaurant = Restaurant.create! valid_attributes
      expect{ 
        delete :destroy, {:id => restaurant.to_param, format: :json }
      }.to change(Restaurant,:count).by(-1) 
    end 

    it "redirects to restaurant#index" do 
      # delete :destroy, id: @restaurant response.should redirect_to restaurants_url 
    end 
  end
end