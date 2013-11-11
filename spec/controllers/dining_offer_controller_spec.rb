require 'spec_helper'

describe DiningOfferController do

  let(:valid_attributes) { {"title" => "abc", "description" => "MyString", "image_url" => "MyString", "web_url" => "MyString", "restaurant_id" => 1} }

  describe "GET #index" do
    it "populates an array of dining_offers" do
      offer = create(:dining_offer)

      get :index, {format: :json}
      assigns(:dining_offers).should eq([offer])
    end
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested dining_offer to @dining_offer" do
      offer = create(:dining_offer)

      get :show, {id: offer.to_param}, {format: :json}
      assigns(:dining_offer).should eq(offer)
    end

    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new DiningOffer to @dining_offer" do
       get :new, {format: :json}

      assigns(:dining_offer).should be_a_new(DiningOffer)
    end
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new dining_offer in the dining_offer" do
        expect {
          post :create, {:dining_offer => valid_attributes, format: :json }
        }.to change(DiningOffer, :count).by(1)
      end

      it "assigns a newly created dining_offer as @dining_offer" do
        post :create, {:dining_offer => valid_attributes, format: :json }
        assigns(:dining_offer).should be_a(DiningOffer)
        assigns(:dining_offer).should be_persisted
      end

      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "assigns a newly created but unsaved dining_offer as @dining_offer" do
        #Trigger the behavior that occurs when invalid params are submitted
        DiningOffer.any_instance.stub(:save).and_return(false)

        post :create, {:dining_offer => {"title" => "invalid value" }, format: :json }
        response.should_not be_success
        assigns(:dining_offer).should_not be_persisted
      end

      it "the paramater name is nil" do
        post :create, {dining_offer: {title: nil}, format: :json }
        response.should_not be_success
        assigns(:dining_offer).should be_a_new(DiningOffer)
      end
    end
  end

   describe 'DELETE destroy' do 

    before :each do 
      dining_offer = create(:dining_offer)
    end 

    it "deletes the dining_offer" do 
      dining_offer = DiningOffer.create! valid_attributes
      expect{ 
        delete :destroy, {:id => dining_offer.to_param, format: :json }
      }.to change(DiningOffer,:count).by(-1) 
    end 

    it "redirects to dining_offer#index" do 
      # delete :destroy, id: @dining_offer response.should redirect_to dining_offers_url 
    end 
  end
end