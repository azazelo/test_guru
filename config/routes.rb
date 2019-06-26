Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about/author', to: 'application#author'
  get 'about', to: 'application#about'

  resources :tests do
    resources :questions
  end
  
  root to: 'tests#index'
   
end
