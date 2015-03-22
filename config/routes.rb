Vinco::Application.routes.draw do
  devise_for :users
  get "welcome/index" => 'welcome#index'
  get "welcome/about" => 'welcome#about'
  root to: 'welcome#index'
  resources :workouts
  resources :drills
  resource :dashboard, :only => [:show]
  resources :team, :only => [:new, :create, :show, :edit, :update]
end
