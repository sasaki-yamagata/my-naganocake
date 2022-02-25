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
    resources :customers, only: [:show, :edit, :update, :destroy] do
      collection do
        get 'confim'
      end
    end
  end
  
  # 管理者用
  get 'admin' => 'admin/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
