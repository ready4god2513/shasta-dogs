ShastaDogs::Application.routes.draw do

  resources :categories


  devise_for :users
  resources :dogs
  resources :posts
  resources :pages
  root to: "static#home"
  
end