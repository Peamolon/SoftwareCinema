class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: %i[ show edit update destroy ]

  # GET /product_orders or /product_orders.json
  def index
    @product_orders = ProductOrder.where(client_id: current_user.client.id)
  end

  # GET /product_orders/1 or /product_orders/1.json
  def show
  end

  # GET /product_orders/new
  def new
    @current_user = current_user
    @multiplex = Multiplex.find(params[:multiplex_id])
    @cinema = Cinema.find(params[:cinema_id])
    @cinema_places = @cinema.cinema_places
    @product_order = ProductOrder.new
    @product_order.product_items.build
  end

  # GET /product_orders/1/edit
  def edit
    @product_order = ProductOrder.find(params[:id])
    @multiplex = Multiplex.find(params[:multiplex_id])
    @cinema = Cinema.find(params[:cinema_id])
    @cinema_places = @cinema.cinema_places
  end

  # POST /product_orders or /product_orders.json
  def create
    @multiplex = Multiplex.find(params[:multiplex_id])
    @product_order = ProductOrder.new(product_order_params.merge(client_id: current_user.client.id, date: Date.today))
    respond_to do |format|
      if @product_order.save
        format.html { redirect_to edit_multiplex_cinema_product_order_path(id: @product_order.id), notice: "Complete the orden and confirm." }
        format.json { render :show, status: :created, location: @product_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_orders/1 or /product_orders/1.json
  def update
    products_value = @product_order.product_items.joins(:product).pluck("products.price").sum(&:to_f)
    tickets_value = @product_order.tickets.joins(:cinema_place).pluck("cinema_places.price").sum(&:to_f)
    final_value = products_value + tickets_value

    product_points = (@product_order.product_items.count * 5)
    ticket_points = (@product_order.tickets.count * 10)
    final_points = product_points + ticket_points
    Point.create(count: final_points, product_order_id: @product_order.id, client_id: current_user.client.id, state: :free)
    respond_to do |format|
      if @product_order.update(product_order_params.merge(value: final_value))
        @product_order.paid!
        @product_order.tickets.each{|ticket| ticket.complete! }
        format.html { redirect_to product_order_path(@product_order.id), notice: "Product order was successfully updated." }
        format.json { render :show, status: :ok, location: @product_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_orders/1 or /product_orders/1.json
  def destroy
    @product_order.destroy

    respond_to do |format|
      format.html { redirect_to product_orders_url, notice: "Product order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_order
      @product_order = ProductOrder.find(params[:id])
    end

    def update_values
      params.require(:product_order).permit(:multiplex_id, :cinema_id ,:client_id, product_items_attributes: [:product_id])
    end


    # Only allow a list of trusted parameters through.
    def product_order_params
      params.permit(:multiplex_id)
    end
end
