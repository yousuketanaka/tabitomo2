class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def new
    @listing = Listing.find(params[:listing_id])
  	@reservation = current_user.reservations.build
    if @reservation
      today = Date.today
      @reservations = Reservation.where("start_date >= ?", today)
      @bookings = @reservations.to_json.html_safe
    end
      # @reservations = Reservation.where(listing_id: 2)
      # respond_to do |format|
      #   format.html
        # format.json {render :json => @reservations}
        # format.xml  {render :xml => @reservations}
      # end
    # else
    #   render "new"
    # render :json => @reservations

    # reservations = Reservation.where("DATE(start_date) >= ? AND listing_id = ?",today, params[:listing_id])
    # ここがうまくいくかどうかを試す。
  end

  # 他人のリスティングと自分のリスティングでの予約をcreateとする。
  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
    # //新規予約登録する場合は、IDが発行されそう。修正する場合は、IDはある。newの場合は、新規予約登録のため、ID発行のコードが必要。

    # 自分で自分の部屋を予約する場合(カレンダーでの予約作成)
    if current_user == @listing.user
      #選択されてた日付 ","で区切って配列化
      selectedDates = params[:reservation][:selectedDates].try(:split, ",")

      # 今まで、自分自身で予約した予約を取り出す
      reservationsByme = @listing.reservations.where(user_id: current_user.id)

      # 以前、自分自身で選択した日付
      oldSelectedDates = []

      # 以前、自分自身で予約した"予約の日付"を配列に入れていく
      reservationsByme.each do |reservation|
        oldSelectedDates.push(reservation.start_date)
      end

      # 以前の自身で選択した日付の予約を全て消す
      if oldSelectedDates
        oldSelectedDates.each do |date|
          @reservation = current_user.reservations.where(start_date: date)
          @reservation.destroy_all
        end
      end

      #新しい日付の予約をクリエイトする
      if selectedDates
        selectedDates.each do |date|
          current_user.reservations.create(:id => @reservation.id, :listing_id => @listing.id, :start_date => date, :self_booking => true)
        end
      end

      # redirect_to :back, notice: "予約確認へ進みます。"
      redirect_to listing_reservation_path(@listing,@reservation), notice:"予約確認へ進みます。"

    else

      # 予約をパラメーター付与して作成
      @reservation = current_user.reservations.create(reservation_params)
      redirect_to listing_reservation_path(@listing, @reservation), notice:"予約確認へ進みます。"

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
    listing = Listing.find_by(params[:listing_id])
    today = Date.today
    reservations = Reservation.where("start_date >= ?",today)
    respond_to do |format|
        format.json { render json: reservations} # jsonを指定した場合、jsonフォーマットで返す
    end
  end

  private

  def reservation_params
  	params.require(:reservation).permit(:id, :start_date, :reservation_time, :reservation_message, :price_setting, :total_price, :listing_id)
  end
end