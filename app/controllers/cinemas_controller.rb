class CinemasController < ApplicationController
  def index
    @mutiplex = Multiplex.find(params[:multiplex_id])
    @cinemas = @mutiplex.cinemas
  end
end
