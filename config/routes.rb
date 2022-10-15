Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    get "/customers/my_page" => "customers#show", as: "my_page"
    get "/customers/information/edit" => "customers#edit", as: "edit_my_page"
    patch "/customers/information" => "customers#update"
    put  "/customers/information" => "customers#update"
    # ↓ 顧客の退会確認画面
    get "/customers/unsubscribe" => "customers#unsubscribe"
    # ↓ 顧客の退会処理(ステータスの更新)
    patch "/customers/withdraw" => "customers#withdraw"
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    post "/orders/confirm" => "orders#confirm"

    resources :orders, only: [:new, :complete, :create, :index, :show]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
