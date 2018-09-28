Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users

  get 'users/:id/posts', controller: :users, action: :posts 
end
