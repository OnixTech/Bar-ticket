class PetitionsController < ApplicationController
    skip_before_action :authenticate_user!, only: :recbaskt
    def recbaskt
        basket_params = JSON.parse(request.body.read)
        p "Recived: #{basket_params} "
    end
end
