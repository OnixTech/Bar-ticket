Rails.application.routes.draw do
  resources :stations
  
  root to: "pages#home"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :companies do
  resources :stations
  end
  post '/bsktreq', to: 'petitions#recbaskt'
  get '/reqtkn', to: 'csrf_tokens#show'
end
