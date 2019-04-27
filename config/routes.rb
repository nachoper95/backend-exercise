Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :publishers
    resources :businesses
    resources :ads do
      put 'verify'
      put 'cancelled'
    end
  end
end
