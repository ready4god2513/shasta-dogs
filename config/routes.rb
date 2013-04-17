ShastaDogs::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

  
  devise_for :users

  unauthenticated do
    resources :categories, only: [:show]
    resources :dogs, only: [:show]
    resources :posts, only: [:index, :show]
    resources :pages, only: [:show]
  end

  authenticated do
    resources :categories
    resources :dogs
    resources :posts
    resources :pages
  end

  root to: "static#home"
  match "*path" => redirect("/")
  
end