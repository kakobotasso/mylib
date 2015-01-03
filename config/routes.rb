Rails.application.routes.draw do
  root 'sessions#new'

  resources :authors
  resources :books
  resources :users

  controller :sessions do
    get  "/",  :action => :new,     :as => :login
    post "/",  :action => :create,  :as => false
    get  "/logout", :action => :destroy, :as => :logout
  end

  controller :books do
    get "/bought/:id", action: :bought, as: :bought
    get "/find-a-book/", action: :search, as: :books_search
  end

  controller :dashboard do
    get "/welcome", action: :index, as: :dashboard 
  end
end
