Rails.application.routes.draw do
  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end