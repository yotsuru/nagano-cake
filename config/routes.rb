Rails.application.routes.draw do
  
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    resources :items,only: [:index,:new,:create,:show,:edit,:update]
    
    resources :customers,only: [:index,:show,:edit,:update]
    
    resources :orders,only: [:index,:show,:update]
    
    
  end

namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    
    resource :customers, only: [:show, :update, :edit]
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers' => 'customers#update', as: 'update_customer'
    　　collection do
       　get 'confirm_withdraw'
       　patch 'withdraw'
        end
   
    
    resources :items,only: [:index,:show]
    
    resources :cart_items,only: [:index,:update,:create,:destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    
    resources :orders,only: [:new,:index,:show,:create]
    get 'orders/complete' => "orders#complete"
    post 'orders/confirm'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end