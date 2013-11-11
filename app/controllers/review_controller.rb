class ReviewController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
  	@reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  	render status: 200, json: @review
  end

  # GET /reviews/new
  def new
  	@review = Review.new
    render status: 200, json: @review
  end

  # GET /reviews/1/edit
  def edit
  	
  end

  # POST /reviews
  # POST /reviews.json
  def create
  	@review = Review.new(review_params)

  	respond_to do |format|
      if @review.save
        format.json { render action: 'show', status: :create, location: @review }
      else
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
  	@review.destroy

  	respond_to do |format|
  		reviews = Review.all
  		format.json { render json: reviews}
  	end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:content, :profile_id, :restaurant_id)
  end
end