Rails.application.routes.draw do
  resources :users do 
    resources :items
  end
  
  resources :items do  
    resources :measurements
  end
  #get('/items', {to: "items#index"}) # Just a method with two arguments 
  
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"
  
  # resources(:items, only: [:show, :index]) # this will only run show and index 

  resources :measurements # this will create 8 requests (run rails routes --expanded to see them)
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end