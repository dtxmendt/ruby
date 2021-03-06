Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
  resources :posts do
    resources :avatars, :only => [:create, :destroy]
    resources :comments
  end
  devise_for :users
  root "posts#index"
  get '/userview' => 'users#userview'
  get 'posts/admin' =>'posts#admin'
  resources :users 


  # root "users#admin"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end

