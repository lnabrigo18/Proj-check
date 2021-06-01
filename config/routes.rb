Rails.application.routes.draw do
  devise_for :users
    resources :categories do
      collection do
        get 'dashboard'
        # get 'study'
        # get 'team'
      end
        resources :tasks
    end
  root "categories#index"
end
