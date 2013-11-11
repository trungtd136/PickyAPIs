class DiningOfferController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /dining_offers
  # GET /dining_offers.json
  def index
    @dining_offers = DiningOffer.all
  end

  # GET /dining_offers/1
  # GET /dining_offers/1.json
  def show
    render status: 200, json: @dining_offer
  end

  # GET /dining_offers/new
  def new
  	@dining_offer = DiningOffer.new
    render status: 200, json: @dining_offers
  end

  # GET /dining_offers/1/edit
  def edit
  	
  end

  # POST /dining_offers
  # POST /dining_offers.json
  def create
  	@dining_offer = DiningOffer.new(offer_params)

  	respond_to do |format|
      if @dining_offer.save
        format.json { render action: 'show', status: :create, location: @dining_offer }
      else
        format.json { render json: @dining_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dining_offers/1
  # DELETE /dining_offers/1.json
  def destroy
  	@dining_offer.destroy

  	respond_to do |format|
  		dining_offers = DiningOffer.all
  		format.json { render json: dining_offers}
  	end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @dining_offer = DiningOffer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def offer_params
    params.require(:dining_offer).permit(:title, :description, :image_url, :web_url, :restaurant_id)
  end
end