Rails.application.routes.draw do
  
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
    root to: "public/homes#top"
    
namespace :admin do
    resources :items,only: [:index,:new,:create,:show,:edit,:update]
    
    resources :customers
    
    resources :orders,only: [:index,:show,:update]
    
    
  end

namespace :public do
   
   
    get '/about' => 'homes#about'
    
    resources :customers,only: [:update] do
        collection do
         get 'customers/mypage' => 'customers#show'
         get 'customers/information/edit' => 'customers#edit'
         patch '/customers' => 'customers#update', as: 'update_customer'
         get 'confirm_withdraw'
         patch 'withdraw'
        end
      end
    
    resources :items,only: [:index,:show]
    
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items,only: [:index,:update,:create,:destroy]
    
    resources :orders,only: [:new,:index,:show,:create] do
       collection do
          post 'confirm'
          get 'complete'
        end
      end
  end
  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end