Rails.application.routes.draw do
  devise_for :ms_users
  resources :ms_members
  resources :ms_books
  resources :tr_loans
  resources :ms_publishers
  get "loan", to: "home#index"
  get "loan/:id", to: "home#show"
  post "loan", to: "home#create"

  root "tr_loans#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
