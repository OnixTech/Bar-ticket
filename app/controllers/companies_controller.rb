class CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company)
  end
end
