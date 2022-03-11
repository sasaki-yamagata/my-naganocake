Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  } 
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # 顧客用
  root :to => "customer/homes#top"
  get 'about' => "customer/homes#about"
  
  scope module: :customer do
    resource :customer, only: [:edit, :update] do
      collection do
        get 'confim'
      end
    end
  end
  get '/mypage' => 'customer/customers#show'
  patch '/customer/destroy' => 'customer/customers#destroy'
  
  # 管理者用
  get 'admin' => 'admin/homes#top'
  namespace :admin do
    resources :customers, only: [:index, :show, :uppdate]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
