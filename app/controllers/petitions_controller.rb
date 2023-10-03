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
        p "Recived in login action: #{@basket_params}"
        #----------------- Login User ------------------#
        user = User.find_by(email: @basket_params["email"])
        if user && user.valid_password?(@basket_params["password"])
          sign_in(user)
        end
        #-----------------------------------------------#
        @order = {
            table: @basket_params["table"],
            content: @basket_params["items"],
            station_id: 1,
        }
        create_order
    end

    def create_order
        session[:order] = @order
        redirect_to new_order_path
    end
end
