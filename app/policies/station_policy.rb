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

  def initialize(current_user, company)
    @current_user = current_user
    @company = company
  end 
  
  def new?
    true
  end
end
