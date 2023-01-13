Rails.application.routes.draw do
  resources :activities, only: [:index, :destroy]
  resources :campers, only: [:index, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  post '/signups', to: 'campers#singup'

end
