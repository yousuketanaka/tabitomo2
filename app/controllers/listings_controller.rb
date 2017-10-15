class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only:[:show, :update, :basics, :description, :address, :price, :photos, :calendar, :bankaccount, :publish]

  def index
    @listings = current_user.listings
  end

  def show
    @photos = @listing.photos
  end

  def new
    # 現在のユーザーのリスティングの作成
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice: "リスティングを作成し、保存しました。"
    else
      redirect_to new_listing_path, notice: "リスティングの保存ができませんでした。"
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to :back, notice:'更新できました。'
    end
  end

  # リスティング作成画面のcontroller

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

  def not_checked
  end

  # リスティング作成画面のcontrollerはここまで

  private
  def listing_params
    params.require(:listing).permit(:service_type, :residentcountry, :residentcity, :language, :language_level, :price_setting, :plan_title, :plan_detail, :shop_info, :acceptable, :plan_time, :guide_detail, :cancel_policy, :capacity, :favorite_topic, :myprofile, :my_goal)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
