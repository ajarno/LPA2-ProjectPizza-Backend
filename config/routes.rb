Rails.application.routes.draw do
  post 'orders/create', to: 'orders#create'
  get 'orders/index', to: 'orders#index'
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
