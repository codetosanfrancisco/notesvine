Rails.application.routes.draw do
  get 'notes/new'
  devise_for :users, :controllers => {:registrations => "users"}
  resources :categories
  resources :notes
  root "dashboard#user"
end
