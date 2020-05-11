class ShowDetailsController < ApplicationController
  before_action :set_show_detail, only: [:show]

  # GET /show_details
  # GET /show_details.json
  def index
    if params[:movie_id]
      @show_details = ShowDetail.where(movie_id: params[:movie_id])
      @booking_details = UserBookingDetailsPresenter.new(@show_details, current_user).details
    end
  end

  # GET /show_details/1
  # GET /show_details/1.json
  def show
    render body: nil unless @show_detail
  end

  # GET /show_details/new
  def new
    @show_detail = ShowDetail.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_detail
      @show_detail = ShowDetail.find_by_id(params[:id])
    end
end
