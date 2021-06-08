Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
    resources :categories do
      collection do
        get 'dashboard'
        # get 'study'
        # get 'team'
      end
        resources :tasks
    end
  root "home#index"
end
