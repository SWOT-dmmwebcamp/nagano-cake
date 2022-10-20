Rails.application.routes.draw do
 
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers
  devise_for :users

  namespace :admin do
    resources :items
    resources :genres, only: [:index, :edit, :update, :create]
  end
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/cart_items' => 'public/cart_items#index'
  

  namespace :admin do
    root to: 'homes#top'
    get '/cust_orders/:id' => 'homes#show'
    resources :orders, only: [:show, :update]
    resources :items
  end
end