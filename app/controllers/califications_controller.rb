class CalificationsController < ApplicationController
  before_action :set_calification, only: %i[ show edit update destroy ]

  # GET /califications or /califications.json
  def index
    @califications = Calification.all
  end

  # GET /califications/1 or /califications/1.json
  def show
  end

  # GET /califications/new
  def new
    @calification = Calification.new
  end

  # GET /califications/1/edit
  def edit
  end

  # POST /califications or /califications.json
  def create
    @calification = Calification.new(calification_params.merge(movie_id: params[:movie_id], date: Date.today))

    respond_to do |format|
      if @calification.save
        format.html { redirect_to movies_path, notice: "Calification was successfully created." }
        format.json { render :show, status: :created, location: @calification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /califications/1 or /califications/1.json
  def update
    respond_to do |format|
      if @calification.update(calification_params)
        format.html { redirect_to calification_url(@calification), notice: "Calification was successfully updated." }
        format.json { render :show, status: :ok, location: @calification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /califications/1 or /califications/1.json
  def destroy
    @calification.destroy

    respond_to do |format|
      format.html { redirect_to califications_url, notice: "Calification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calification
      @calification = Calification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calification_params
      params.require(:calification).permit(:comment, :rate)
    end
end
