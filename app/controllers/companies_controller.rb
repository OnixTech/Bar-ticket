class CompaniesController < ApplicationController
  before_action :set_station, only: [:show]
  def index
    @companies = policy_scope(Company)
  end

  def show
    authorize @company
    @stations = Station.where(company: @company)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_station
    @company = Company.find(params[:id])
  end
end
