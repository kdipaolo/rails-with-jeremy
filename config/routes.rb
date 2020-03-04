Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  match '/add-comment' => 'posts#addComment', via: :post

  # match '/star-wars' => 'pages#get_star_wars', via: :get

end
