Rails.application.routes.draw do
  resources :metric_details
  get 'map/index'

  get 'welcome/index'

  resources :users
  resources :metrics
  resources :drivers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
