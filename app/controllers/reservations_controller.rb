class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def new
    @listing = Listing.find(params[:listing_id])
  	@reservation = current_user.reservations.build
  end

  def create
    @listing = Listing.find(params[:listing_id])
  	@reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      redirect_to listing_reservation_path(@listing, @reservation)
    end
  end

  def show
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to listing_reservation_path(@listing, @reservation), notice:'予約情報が更新されました。'
    else
      redirect_to @listing, notice: "予約の更新に失敗しました。"
    end
  end

  def setdate
    listing = Listing.find(params[:listing_id])
    today = Date.today
    reservations = listing.reservations.where("start_date >= ?",today)
    respond_to do |format|
        format.json { render json: reservations } # jsonを指定した場合、jsonフォーマットで返す
    end
  end

  private

  def reservation_params
  	params.require(:reservation).permit(:start_date, :reservation_time, :reservation_message, :price_setting, :total_price, :listing_id)
  end
end