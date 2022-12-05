class MultiplexesController < ApplicationController
  before_action :set_multiplex, only: %i[ show edit update destroy ]

  # GET /multiplexes or /multiplexes.json
  def index
    @multiplexes = Multiplex.all
  end

  # GET /multiplexes/1 or /multiplexes/1.json
  def show
    @multiplex = Multiplex.find(params[:id])
    @cinemas = @multiplex.cinemas
  end

  # GET /multiplexes/new
  def new
    @multiplex = Multiplex.new
  end

  # GET /multiplexes/1/edit
  def edit
  end

  # POST /multiplexes or /multiplexes.json
  def create
    @multiplex = Multiplex.new(multiplex_params)

    respond_to do |format|
      if @multiplex.save
        format.html { redirect_to multiplex_url(@multiplex), notice: "Multiplex was successfully created." }
        format.json { render :show, status: :created, location: @multiplex }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @multiplex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multiplexes/1 or /multiplexes/1.json
  def update
    respond_to do |format|
      if @multiplex.update(multiplex_params)
        format.html { redirect_to multiplex_url(@multiplex), notice: "Multiplex was successfully updated." }
        format.json { render :show, status: :ok, location: @multiplex }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @multiplex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multiplexes/1 or /multiplexes/1.json
  def destroy
    @multiplex.destroy

    respond_to do |format|
      format.html { redirect_to multiplexes_url, notice: "Multiplex was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiplex
      @multiplex = Multiplex.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multiplex_params
      params.fetch(:multiplex, {})
    end
end
