FiveInch::Application.routes.draw do
  get "discussions/create"

  get "discussions/update"

  get "discussions/show"

  get "discussions/destroy"

  root :to => 'welcome#index'

  resources :users 
  resources :projects do
    resources :discussions
  end

  resources :discussions do 
    resources :discussions_responses
  end
  resources :session, :only => [:create, :destroy, :new]
  resources :discussions_responses, :only => [:update]
  get 'login' => 'sessions#new'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'
end
