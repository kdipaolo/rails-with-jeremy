Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end
  
  # root to: "pages#index"

  match '/add-comment' => 'posts#addComment', via: :post

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

