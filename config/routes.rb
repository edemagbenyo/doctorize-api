Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :specialities do
    resources :diseases
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  scope 'users/:id' do
    resources :healthinfos , only:[:index, :create, :update]
  end
end
