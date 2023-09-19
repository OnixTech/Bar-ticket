class StationsController < ApplicationController
  before_action :set_station, only: %i[ show edit update destroy ]

  # GET /stations or /stations.json
  def index
    @stations = policy_scope(Station)
  end

  # GET /stations/1 or /stations/1.json
  def show
    @station = Station.new
    authorize @station
  end

  # GET /stations/new
  def new
    @station = Station.new
    @company_id = params[:company_id]
    authorize @station
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations or /stations.json
  def create
    @station = Station.new(station_params)
    authorize @station
    if @station.save
      flash[:success] = "Resource was successfully created."
      redirect_to company_path(@station.company_id)
    else
      render 'new'
    end
  end

  # PATCH/PUT /stations/1 or /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to station_url(@station), notice: "Station was successfully updated." }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1 or /stations/1.json
  def destroy
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url, notice: "Station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def station_params
      params.require(:station).permit(:name, :company_id)
    end
end
