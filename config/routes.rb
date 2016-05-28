Rails.application.routes.draw do
  resources :students

  root 'main#index'
end
