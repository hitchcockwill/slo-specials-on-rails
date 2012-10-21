SloSpecials::Application.routes.draw do

  namespace :api do
    namespace :v1, :defaults => { :format => 'json' } do
      match "deals/food" => "deals#food", :as => :food
      resources :deals, :venues
    end
  end

  resources :deals, :venues

  get "home/index"
  root :to => 'home#index'

  match "day/today" => "deals#index"
  match "day/:day" => "deals#index"
  match "food" => "deals#index"
  match "food/:day" => "deals#index"
  match "drinks" => "deals#index"
  match "drinks/:day" => "deals#index"
end
