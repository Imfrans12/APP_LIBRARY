Rails.application.routes.draw do
  devise_for :ms_users
  resources :ms_members
  resources :ms_books
  resources :tr_loans
  resources :ms_publishers

  root "ms_members#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
