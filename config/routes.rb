Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'challenges#index'

  namespace :api do
    namespace :v1 do
      resources :challenges, param: :slug
      resources :users, param: :id
      resources :admins, param: :id
      resources :leaderboard, param: :slug
      resources :teams, param: :slug
    end
  end

  get '*path', to: 'pages#index', via: :all
end
