Rails.application.routes.draw do

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
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
    resource :customer, only: [:edit, :update, :destroy] do
      collection do
        get 'confim'
      end
    end
  end
  get '/mypage' => 'customer/customers#show'
  
  # 管理者用
  get 'admin' => 'admin/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
