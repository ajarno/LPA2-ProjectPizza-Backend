Rails.application.routes.draw do
  get 'orders/create'
  get 'orders/index'
  post 'orders/create', to: 'orders#create'
  get 'orders/index', to: 'orders#index'
  resources :pizzas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
