Rails.application.routes.draw do
  root to: "posts#index"
  
  resources :posts do 
    resources :comments
  end
  
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

