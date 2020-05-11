class ShowDetail < ApplicationRecord
  belongs_to :theatre
  belongs_to :movie
  has_many :bookings

  def valid_show?
  	(date > Date.today) || (date == Date.today && timing.in_time_zone('Kolkata').strftime( "%H%M" ) > Time.now.in_time_zone('Kolkata').strftime( "%H%M" ))
  end
end
