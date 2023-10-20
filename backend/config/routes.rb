Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :pizzas, only: %i[index show]
  end
end
