Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  namespace :api do
    resources :pizzas, only: [:index]
    resources :orders, only: %i[index show]
  end
end
