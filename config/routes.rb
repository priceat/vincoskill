Vinco::Application.routes.draw do
  devise_for :users
  get "welcome/index" => 'welcome#index'
  root to: 'welcome#index'
  resources :workouts
  resources :drills
end
