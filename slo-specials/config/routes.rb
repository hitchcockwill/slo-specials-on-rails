SloSpecials::Application.routes.draw do

  namespace :api do
    namespace :v1, :defaults => { :format => 'json' } do
      match "deals/:kind" => "deals#by_kind"
      match "day/:day" => "deals#by_day"
      resources :deals, :venues
    end
  end

  resources :deals, :venues

  get "home/index"
  root :to => 'home#index'

  # Deals Routes
  match "deals/daily/:day" => "deals#index"
  match "deals/daily" => "deals#index"
  match "deals/food" => "deals#index"
  match "deals/food/:day" => "deals#index"
  match "deals/drinks" => "deals#index"
  match "deals/drinks/:day" => "deals#index"

  match "places/:id" => "venues#show"
  match "places" => "venues#index"
end
