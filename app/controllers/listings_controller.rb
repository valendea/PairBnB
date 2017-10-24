class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :verify]
  before_action :require_login, only: [:new, :edit, :update, :destroy]
  before_action :allowed?, only: [:verify]

  # GET /listings
  # GET /listings.json
  def index
    # @listings = Listing.order("created_at DESC").page params[:page]
    @listings = Listing.order(:title).page params[:page]
    # @listings = Listing.page(1).per(10)
  end

  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  def verify
    if current_user.customer?
      flash[:notice] = "Sorry. You do not have the permission to verify a property."
      redirect_to "/"
    else
      @listing.update(verification: true)
      flash[:notice] = "This property has been verified."
      redirect_to "/"
    end

  end

  # POST /listings
  # POST /listings.json
  # def create
  #   @listing = Listing.new(listing_params)

  #   resp
  #   @listings = Listing.all
  #   render :"index", layout: true
  # end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # POST /listings
  def create
    @listing = current_user.listings.new(listing_params)
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params

      params.require(:listing).permit(:user_id, :title, :property_type, :num_of_rooms, photos: [])

      # params.require(:listing).permit(:user_id, :title, :property_type, :num_of_rooms, :price, :description, :no_of_bathrooms, :house_rules)
    end

    def allowed?
      return !current_user.customer?

    end
end
