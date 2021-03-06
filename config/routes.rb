Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #cats_url, new_cat_url, edit_cat_url, cat_url
  resources :cats do
    #cat_cat_rental_requests_url
    resources :cat_rental_requests, only: [:index]
  end

  #cat_rental_requests_url, new_cat_rental_request_url, cat_rental_request_url
  resources :cat_rental_requests, only: [:index, :show, :new, :create, :destroy]

  #approve_cat_rental_request, deny_cat_rental_request
  resources :cat_rental_requests, only: [:show] do
    member do
      get :approve
    end
    member do
      get :deny
    end
  end

  #users_url, new_user_url, edit_user_url, user_url
  resources :users do
    #user_cat_url
    resources :cats, only: [:show, :update, :edit]
    #user_requests_url
    resources :requests, only: [:index, :show, :update, :edit]
  end

  #new_session_url, session_url
  resource :session, only: [:new, :create, :destroy]

  root to: 'cats#index'
end


