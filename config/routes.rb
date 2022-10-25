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
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :create, :update, :destroy]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    get 'customers/my_page' => "customers#show", as: "my_page"
    get 'customers/information/edit' => "customers#edit", as: "information"
    get 'customers/unsubscribe' => "customers#unsubscribe", as: "unsubscribe"
    resources :orders
    resources :deliverys, only: [:index, :edit, :update, :create, :destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    get '/cust_orders/:id' => 'homes#show'
    resources :orders, only: [:show, :update]
    resources :orderdetails, only: [:update]
    resources :items
    resources :genres, only: [:index, :edit, :update, :create]
    resources :customers, only: [:index,:show,:edit,:update]
  end
  
end