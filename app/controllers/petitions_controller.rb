class PetitionsController < ApplicationController
    def recbaskt
        # Receive and parse the JSON data from the request body
        basket_params = JSON.parse(request.body.read)

        # Now, you can access the "basket" object as a regular Ruby hash
        # For example, you can access a specific key like this:
        table = basket_params['table']

        # Do something with the "basket" data here

        # Respond with JSON data (optional)
        render json: { message: 'Basket data received successfully' }
        p basket_params
    end
end
