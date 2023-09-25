class CsrfTokensController < ApplicationController
    skip_before_action :authenticate_user!, only: :show
    def show
        skip_authorization
        csrf_token = form_authenticity_token
        render json: { csrf_token: csrf_token }
    end
end
