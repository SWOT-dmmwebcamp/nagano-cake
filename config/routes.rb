Rails.application.routes.draw do


  devise_for :customers,skip: [:passwords], controllers: {

  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about" , as: "about"
    resources :items, only: [:index, :show]
    resources :customers
    resources :cart_items
    resources :orders
    resources :deliverys, only: [:index, :edit, :update, :create, :destroy]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: 'homes#top'
    get '/cust_orders/:id' => 'homes#show'
    resources :orders, only: [:show, :update]
    resources :items
    resources :genres, only: [:index, :edit, :update, :create]
    resources :customers, only: [:index,:show,:edit,:update]
  end
end