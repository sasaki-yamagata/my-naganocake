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
  
  # customers
  scope module: :customer do
    resource :customer, only: [:edit, :update] do
      collection do
        get 'confim'
      end
    end
  end
  get '/mypage' => 'customer/customers#show'
  patch '/customer/destroy' => 'customer/customers#destroy'
  
  # items
  scope module: :customer do
    resources :items, only: [:index, :show]
  end
  
  # cart_items
  scope module: :customer do
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
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
