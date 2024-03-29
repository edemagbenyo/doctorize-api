Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :specialities do
    resources :diseases
  end
  get 'specialities/:speciality_id/doctors', to: 'specialities#doctors'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'signup_doctor', to: 'users#create_doctor'
  get 'user', to: 'users#index'
  resources :healthinfos , only:[:index, :create, :update]
  resources :appointments, only:[:index, :create, :update]
  resources :doctors, only:[:index, :create, :update, :show]

  post 'favourites', to: 'favourites#create'
  get 'favourites/:user_id/doctors', to: 'favourites#doctors'
  get 'favourites/:doctor_id/users', to: 'favourites#users'
end
