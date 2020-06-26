Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ================================API+=========================
  namespace :api do 
    namespace :v1 do
      devise_scope :user do
        resources :sessions
      end
      resources :products, only: [:index, :show]
      resource :order
    end
  end
  
end
