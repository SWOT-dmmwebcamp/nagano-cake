Rails.application.routes.draw do
    
  
    namespace :admin do
    resources :genres, only: [:index, :edit, :update, :create]
  end
# 管理者用
# URL /admin/sign_in ...
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }

#HTTPメソッド 'URL' => 'コントローラ#アクション'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end