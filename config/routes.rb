Rails.application.routes.draw do
  devise_for :users
  resources :messages, param: :token
  root 'messages#index'
end
