Ringtack::Application.routes.draw do

  authenticated :user do
    root :to => 'static_pages#home'
  end

  root :to => 'static_pages#home'

  devise_for :users
  
  resources :rings do
    resources :posts
  end
  
  
  resources :ring_sessions, only: [:create]
  
  
end
