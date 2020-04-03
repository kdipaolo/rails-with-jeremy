Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  match '/add-comment' => 'posts#addComment', via: :post

  # match '/star-wars' => 'pages#get_star_wars', via: :get
  
  controller :users do 
    get 'signup' => :new
    post 'signup' => :create
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create 
    delete 'logout' => :destroy
  end

end

