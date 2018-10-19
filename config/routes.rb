Rails.application.routes.draw do
  resources :powers

  resources :heroines
  #I've done all my routes to be able to access all my methods including destroy destroy.  
end
