Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users"}
  resources :categories
  resources :notes do
    member do
      get "move"
    end
  end
  root "dashboard#user"
  get "dashboard/search",as: :search_dashboard
end
