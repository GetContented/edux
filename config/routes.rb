Rails.application.routes.draw do
  resources :students
  resources :teachers

  root 'main#index'
end
