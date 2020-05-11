class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :cancel]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = current_user.bookings.order("id desc")
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    render body: nil unless @booking
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @show_detail = ShowDetail.find_by_id(params[:show_detail_id])
    render body: nil unless @show_detail
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = current_user.bookings.create(booking_params)
    @booking.status = 'booked'
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        show_detail = ShowDetail.find(booking_params[:show_detail_id])
        format.html { redirect_to movie_show_details_path(movie_id: show_detail.movie_id), notice: @booking.errors.messages[:error].join(',') }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    @booking.update(status: 'cancelled')
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = current_user.bookings.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:show_detail_id, :total)
    end
end
