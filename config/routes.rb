Rails.application.routes.draw do
  
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    #resource :customers, only: [:show, :update, :edit]
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers' => 'customers#update', as: 'update_customer'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end