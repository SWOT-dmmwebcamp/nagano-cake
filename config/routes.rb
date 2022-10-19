Rails.application.routes.draw do
  devise_for :customers
  devise_for :users

  namespace :admin do
    resources :items

  end
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
