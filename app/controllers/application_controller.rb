class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email) }
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :gender) }
	end

end
	