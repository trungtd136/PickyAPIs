class PhotoController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    render status: 200, json: @photo
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    render status: 200, json: @photo
  end

  # GET /photos/1/edit
  def edit

  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.json { render action: 'show', status: :create, location: @photo }
      else
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy

    respond_to do |format|
      photos = Photo.all
      format.json { render json: photos}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    params.require(:photo).permit(:title, :description, :img_thumb_url, :img_url, :profile_id, :restaurant_id)
  end
end