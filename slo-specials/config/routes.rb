SloSpecials::Application.routes.draw do

  namespace :api do
    namespace :v1, :defaults => { :format => 'json' } do
      match "deals/:kind" => "deals#by_kind"
      resources :deals, :venues
    end
  end

  resources :deals, :venues

  get "home/index"
  root :to => 'home#index'

  # Deals Routes
  match "day/today" => "deals#index"
  match "day/:day" => "deals#index"
  match "food" => "deals#index"
  match "food/:day" => "deals#index"
  match "drinks" => "deals#index"
  match "drinks/:day" => "deals#index"

  match "places" => "venues#index"
end
