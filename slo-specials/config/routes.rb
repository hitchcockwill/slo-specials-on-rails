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

  match "deals-by-day" => "deals#index"
end
