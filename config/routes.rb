Rails.application.routes.draw do
  get 'books/new'
  get 'books/edit'
  get 'top' => 'homes#top'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'books/show'
  # .../books/1 や.../books/3に該当する
  get 'books/:id' => 'homes#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
