Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions do
    member do
      get :analyses, controller: "questions/reviews"
      put :approve, controller: "questions/reviews"
      get :comment, controller: "questions/reviews"
      put :reprove, controller: "questions/reviews"
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
