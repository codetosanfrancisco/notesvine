Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users"}
  resources :categories
  resources :notes
  root "dashboard#user"
end
