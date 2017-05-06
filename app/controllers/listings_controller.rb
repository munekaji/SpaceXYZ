class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:update, :basics, :description, :address, :price, :photos, :calendar, :bankaccount, :publish]

  def index
  end

  def show
  end

  def new
    #現在のユーザーのリスティング作成
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice: "listing has been built and saved successfully."
    else
      redirect_to new_listing_path, notice: "listing process has been failed."
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to :back, notice: "Updated"
    end
  end

  def basics
  end

  def description
  end

  def address
  end

  def price
  end

  def photos
    @photo = Photo.new
  end

  def calendar
  end

  def bankaccount
  end

  def publish
  end

  private
  def listing_params
    params.require(:listing).permit(:satellite_type, :data_type, :acquisition_years, :data_size, :price_pernight, :active)    
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end