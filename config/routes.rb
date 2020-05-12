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
  # TODO: Want this to be password_reset but was seeing errors when i was trying to make that name change
  resource :password, except: :edit do
    get 'edit/:password_reset_token', on: :member, to: 'passwords#edit', as: 'edit'
  end

end

