class StationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role == "master"
        scope.all
      else 
        scope.where(company: @company)
      end 
    end
  end

  def initialize(current_user, station)
    @current_user = current_user
    @station = station
  end

  def show?
    authorize_user
  end
  
  
  def new?
    user_active
  end
  
  def create?
    authorize_user || authorize_master
  end

  private

  def authorize_user
    @current_user == @station.company.user
  end

  def authorize_master
    @current_user.role.name == "master"
  end

  def user_active
    @current_user.active?
  end
end
