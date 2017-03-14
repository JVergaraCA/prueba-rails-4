Rails.application.routes.draw do


  devise_for :users
  resources :enterprises do
  	resources :comments, only: [:create, :destroy]
  end
  root "enterprises#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
