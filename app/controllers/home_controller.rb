class HomeController < ApplicationController
	before_action :require_login

	def index
	end

private

def require_login
  if current_user.present?
   	redirect_to controller: 'bookings', action: 'index'
  else
   	redirect_to controller: 'movies', action: 'index'
  end   
end
	
end
