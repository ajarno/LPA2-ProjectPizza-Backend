Rails.application.routes.draw do
  post 'orders/create', to: 'orders#create'
  get 'orders', to: 'orders#index'
  resources :pizzas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
