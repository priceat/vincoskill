Vinco::Application.routes.draw do
  devise_for :users
  get "welcome/index" => 'welcome#index'
  get "welcome/about" => 'welcome#about'
  get "dashboard/player" => 'dashboards#player'
  get "dashboard/coach" => 'dashboards#coach'
  get "dashboard/admin" => 'dashboards#admin'
  resources :players
  resources :workouts do
    resources :exercises, :only => [:show, :update, :new, :create] do
      resources :drills, :only => [:show]
    end
  end
  resources :drills
  resources :teams, :only => [:new, :create, :show, :edit, :update]
   root to: 'welcome#index'
end
