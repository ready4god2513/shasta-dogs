ShastaDogs::Application.routes.draw do

  devise_for :users
  resources :dogs
  resources :posts
  resources :pages
  root to: "static#home"
  
end