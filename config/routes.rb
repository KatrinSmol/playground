Rails.application.routes.draw do
  devise_for :users

  resources :students do
    resources :selfies
  end

  resources :selfies, only: :index
  resources :groups

  get 'welcome/index'
  get 'welcome/rap'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
