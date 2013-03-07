ShastaDogs::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

  resources :categories


  devise_for :users
  resources :dogs
  resources :posts
  resources :pages
  root to: "static#home"
  
end