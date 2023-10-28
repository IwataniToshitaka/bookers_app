Rails.application.routes.draw do
  get 'books/new'
  get 'top' => 'homes#top'
  get '/edit' => 'books#edit'
  resources :books
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
