require 'spec_helper'

describe PhotoController do

  let(:valid_attributes) { {"title" => "abc", "description" => "MyString MyString", "img_thumb_url" => "MyString", "img_url" => "MyString", "profile_id" => 1, "restaurant_id" => 1} }

  describe "GET #index" do
    it "populates an array of photos" do
      photo = create(:photo)

      get :index, {format: :json}
      assigns(:photos).should eq([photo])
    end

    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested photo to @photo" do
      photo = create(:photo)

      get :show, {id: photo.to_param}, {format: :json}
      assigns(:photo).should eq(photo)
    end

    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Photo to @photo" do
      get :new, {format: :json}

      assigns(:photo).should be_a_new(Photo)
    end

    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
     it "saves the new photo in the database" do
        expect {
          post :create, {:photo => valid_attributes, format: :json }
        }.to change(Photo, :count).by(1)
      end

      it "assigns a newly created photo as @photo" do
        post :create, {:photo => valid_attributes, format: :json }
        assigns(:photo).should be_a(Photo)
        assigns(:photo).should be_persisted
      end

      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "assigns a newly created but unsaved photo as @photo" do
        #Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)

        post :create, {:photo => {"title" => "invalid value" }, format: :json }
        response.should_not be_success
        assigns(:photo).should_not be_persisted
      end

      it "the paramater name is nil" do
        post :create, {photo: {name: nil}, format: :json }
        response.should_not be_success
        assigns(:photo).should be_a_new(Photo)
      end
    end
  end

  describe 'DELETE destroy' do 

    before :each do 
      photo = create(:photo)
    end 

    it "deletes the photo" do 
      photo = Photo.create! valid_attributes
      expect{ 
        delete :destroy, {:id => photo.to_param, format: :json }
      }.to change(Photo,:count).by(-1) 
    end 

    it "redirects to photo#index" do 
      # delete :destroy, id: @photo response.should redirect_to photos_url 
    end 
  end
end
