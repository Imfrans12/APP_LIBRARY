Rails.application.routes.draw do
  resources :ms_members
  resources :ms_books
  resources :tr_loans
  resources :ms_publishers
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
