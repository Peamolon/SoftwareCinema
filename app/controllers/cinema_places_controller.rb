class CinemaPlacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def process_place
    @cinema_place = CinemaPlace.find(params[:id])
    Ticket.create(cinema_place_id: @cinema_place.id, product_order_id: params[:order_id])
  end
end
