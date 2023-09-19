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
  def show?
    authorize_user
  end 

  private

  def authorize_user
    @current_user == @company.user
  end
end
