Rails.application.routes.draw do
  

# ---------------　顧客用 ---------------
  # devise
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  } 
  
  # homes
  root :to => "customer/homes#top"
  get 'about' => "customer/homes#about"
  
  # マイページ
  get '/mypage' => 'customer/customers#show'
  
  # 退会処理
  patch '/customer/destroy' => 'customer/customers#destroy'
  
  scope module: :customer do
    
    # customers
    resource :customer, only: [:edit, :update] do
      collection do
        get 'confim'
      end
    end
    
    # items
    resources :items, only: [:index, :show]
    
    # cart_items
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    
    # addresses
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
    
    
  end

 
# ---------------　管理者用 ---------------
  # devise
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # customers, items, genres
  get 'admin' => 'admin/homes#top'
  namespace :admin do
    resources :customers, only: [:index, :show, :uppdate]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
