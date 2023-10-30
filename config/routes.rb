Rails.application.routes.draw do
  root 'books#new'
  get '/index' => 'books#index'
  get '/edit' => 'books#edit'
  get 'books/show' => 'books#show'
  resources :books
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
