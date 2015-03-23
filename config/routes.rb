Vinco::Application.routes.draw do
  devise_for :users
  get "welcome/index" => 'welcome#index'
  get "welcome/about" => 'welcome#about'
  get "dashboard/player" => 'dashboards#player'
  get "dashboard/coach" => 'dashboards#coach'
  # get "team/new" => 'teams#new'
  resources :players
  resources :workouts
  resources :drills
  # resources :dashboards, :only => [] do 
  #      collection do
  #      get 'player' 
  #      end
  # end
  resources :teams, :only => [:new, :create, :show, :edit, :update]
   root to: 'welcome#index'
end
