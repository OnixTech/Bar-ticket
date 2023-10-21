class PetitionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :recbaskt
    skip_before_action :authenticate_user!, only: :recbaskt

    def recbaskt
        skip_authorization
        @basket_params = JSON.parse(request.body.read)
        station_id = @basket_params["station_id"]
        if (station_id.class == Integer) && (station_id > 0)
          login
        else
          puts "false"
          return render json: { message: 'Unprocessable Entity' }, status: :unprocessable_entity
        end
    end

    private

    def login
        #----------------- Login User ------------------#
        user = User.find_by(email: @basket_params["email"])
        if user && user.valid_password?(@basket_params["password"])
          sign_in(user)
          if current_user.present?
            puts "Pablo is connected"
          else
            puts "Pablo is disconected"
          end
        end
        #-----------------------------------------------#
        @order = {
            table: @basket_params["table"],
            content: @basket_params["items"],
            total: @basket_params["total"],
            station_id: @basket_params["station_id"],
        }
        create_order
    end

    def create_order
        session[:order] = @order
        redirect_to new_order_path
    end
end
