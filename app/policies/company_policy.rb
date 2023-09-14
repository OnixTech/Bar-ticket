class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
        if user.role == "master"
          scope.all
        else 
          scope.where(user: user)
        end 
    end
  end
 
  def initialize(current_user, company)
    @current_user = current_user
    @company = company
  end 
  
  def index?
    true
  end 

  private

  def authorize_user
    @current_user.id == @company.user_id
  end
end
