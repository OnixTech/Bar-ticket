class PetitionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :recbaskt
  skip_before_action :authenticate_user!, only: :recbaskt

  def recbaskt
      skip_authorization
      @basket_params = JSON.parse(request.body.read)
      login
  end

  private

  def login
    #----------------- Login User ------------------#
    user = User.find_by(email: @basket_params["email"])
    if user && user.valid_password?(@basket_params["password"])
      sign_in(user)
    end
    create_order
  end

  def create_order
    orders = []
    company_name = @basket_params["company"]
    table = @basket_params["table"]
    total = @basket_params["total"]
    items = @basket_params["items"]

    company = Company.find_by(name: company_name)
    stations = Station.where(company_id: company)
    
    if stations.length > 1
      stations.each do |station|
        acumulator = 0.00
        order = {
          table: table,
          content: [],
          total: total,
          number: 1,
          station_id: station["id"]
        }

        items.each do |item| 
          if station["name"] == item["station"]
            order[:content] << item
            acumulator += item["price"] * item["quantity"]
          end
        end
        if order[:content].size > 0
          order[:total] = acumulator
          orders << order
        end
      end
      session[:orders] = orders
      redirect_to new_order_path
    end
  end
end
