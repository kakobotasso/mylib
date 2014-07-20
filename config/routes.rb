Rails.application.routes.draw do
  root 'sessions#new'

  resources :authors
  resources :books

  controller :sessions do
    get  "/",  :action => :new,     :as => :login
    post "/",  :action => :create,  :as => false
    get  "/logout", :action => :destroy, :as => :logout
  end

  controller :dashboard do
    get "/welcome", action: :index, as: :dashboard 
  end

end
