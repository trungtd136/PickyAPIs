require 'spec_helper'

describe ReviewController do

  let(:valid_attributes) { {"content" => "abc abc def", "profile_id" => 1, "restaurant_id" =>1} }

  describe "GET #index" do
    it "populates an array of reviews" do
      review = create(:review)

      get :index, {format: :json}
      assigns(:reviews).should eq([review])
    end

    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested review to @review" do
      review = create(:review)

      get :show, {id: review.to_param}, {format: :json}
      assigns(:review).should eq(review)
    end

    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Review to @review" do
      get :new, {format: :json}

      assigns(:review).should be_a_new(Review)
    end

    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new review in the database" do
        expect {
          post :create, {:review => valid_attributes, format: :json }
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created review as @review" do
        post :create, {:review => valid_attributes, format: :json }
        assigns(:review).should be_a(Review)
        assigns(:review).should be_persisted
      end

      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "assigns a newly created but unsaved review as @review" do
        #Trigger the behavior that occurs when invalid params are submitted
        Review.any_instance.stub(:save).and_return(false)

        post :create, {:review => {"content" => "invalid value" }, format: :json }
        response.should_not be_success
        assigns(:review).should_not be_persisted
      end

      it "the paramater content is nil" do
        post :create, {review: {content: nil}, format: :json }
        response.should_not be_success
        assigns(:review).should be_a_new(Review)
      end
    end
  end

  describe 'DELETE destroy' do 

    before :each do 
      review = create(:review)
    end 

    it "deletes the review" do 
      review = Review.create! valid_attributes
      expect{ 
        delete :destroy, {:id => review.to_param, format: :json }
      }.to change(Review,:count).by(-1) 
    end 

    it "redirects to review#index" do 
      # delete :destroy, id: @review response.should redirect_to reviews_url 
    end 
  end
end
