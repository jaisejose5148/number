Rails.application.routes.draw do
 # resources :user_phnnumbers
  resources :users, only: [:index, :show, :create, :update, :destroy]
resources :user_phnnumbers do
  collection do
    get :details
    post :insert_number
  end
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
