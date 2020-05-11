class TheatresController < ApplicationController

  # GET /theatres
  # GET /theatres.json
  def index
    @theatres = Theatre.all
  end

end
