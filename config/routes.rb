Rails.application.routes.draw do

  root 'welcome#index'
  resources :products do
    member do
      get 'add_images'
      post 'create_images'
      post 'like'
      post 'wishlist'
    end
  end
  resources :product_images, only: [:destroy]
  devise_for :users, :controllers => { :omniauth_callbacks => "auth/omniauth_callbacks" }, :skip => [:sessions, :passwords, :registrations]
  devise_scope :user do
    delete "/logout" => "devise/sessions#destroy"
  end
  post ':id/add_to_cart' => 'cart#add'
  post ':id/remove_from_cart' => 'cart#remove'
  get 'cart' => 'cart#show'

end
