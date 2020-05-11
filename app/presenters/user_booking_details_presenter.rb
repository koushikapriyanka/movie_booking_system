class UserBookingDetailsPresenter

  def initialize(show_details, current_user=nil)
    @data = {}
    show_details.each do |show_detail|
      seats_count = show_detail.theatre.seat_limit - show_detail.bookings.where(status: 'booked').count
      @data[show_detail.id] = {seats_left: (seats_count.positive? ? seats_count : 0)}
      if current_user
        user_bookings = current_user.bookings.where(show_detail_id: show_detail.id).pluck(:status).uniq
        booked = (user_bookings && user_bookings.include?('booked')) ? true : false
        @data[show_detail.id][:can_cancel] = booked
      end
    end 
  end 

  def details
    @data
  end

end