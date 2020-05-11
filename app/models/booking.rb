class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show_detail

  validate :sold_out, :valid_show

  def sold_out
  	seats_left = show_detail.theatre.seat_limit - show_detail.bookings.where(status: 'booked').count
  	errors.add(:error, 'You cannot book because seats are sold out') unless seats_left.positive?
  end

  def valid_show
  	errors.add(:error, 'You cannot book for past show') if show_detail.date <= Date.today  && show_detail.timing.in_time_zone('Kolkata').strftime("%H%M") < Time.now.in_time_zone('Kolkata').strftime("%H%M")
  end
end
