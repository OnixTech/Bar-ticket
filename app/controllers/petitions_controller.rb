class PetitionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :recbaskt
    skip_before_action :authenticate_user!, only: :recbaskt

    def recbaskt
        skip_authorization
        basket_params = JSON.parse(request.body.read)
        p "Recived: #{basket_params} "
    end
end
