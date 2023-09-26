class OrdersController < ApplicationController

    def new

    end

    def create

    end

    def delete
    
    end
    private

    def order_params
      params.require(:station).permit(:name, :company_id)
    end
end
