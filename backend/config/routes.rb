Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :orders, only: %i[index show]
    resources :pizzas, only: %i[index show]
  end
end
