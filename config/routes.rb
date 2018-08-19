Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users"}
  root "dashboard#user"
end
