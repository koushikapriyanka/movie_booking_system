class MoviesController < ApplicationController

  def index
	@movies = Movie.joins(:show_details).where("show_details.date >= ?", Date.today).group(:id)
  end

end
