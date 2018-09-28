Rails.application.routes.draw do
  resources :news
  resources :categories
  get 'sessions/new'

  get 'robs/index'

  post 'robs/new'
  # resources :robs
  #post 'destroy/index'
  #post 'robs/new'
  # get 'comments/new/rob_id/:rob_id' => 'comments#new'
  # post "/comments/edit/rob_id/:rob_id'"  => 'comments#edit'
  # resources :comments
  
  resources :feeds, only: [:show, :edit, :update, :destroy]
  resources :robs, only: [:new, :create, :edit, :destroy]
  resources :sessions, only: [:new, :create, :edit, :destroy]
  resources :comments, only: [:new, :create, :edit, :destroy]
  resources :users
  # resources :favorites, only: [:create, :destroy]
  
  # resources :robs do
  #   resources :comments
  # end
  
  # resources :robs do
  #   resources :news
  # end
  # resources :robs do
  #   resources :categories
  # end
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  root to: 'sessions#new'
  
  
  
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
   resources :robs do
    collection do
      post :confirm
    end
   end
#  devise_scope :user do
 #  get "register", :to => "devise/registrations#new"
  # get "login", :to => "devise/sessions#new"
   #get "logout", :to => "devise/sessions#destroy"
  #end
   #devise_for :installs
end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

