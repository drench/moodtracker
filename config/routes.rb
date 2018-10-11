Rails.application.routes.draw do
  namespace :api do
    post "/users" => 'users#create'
    post '/sessions' => 'sessions#create'

    get "/journals" => 'journals#index'
    post "journals/" => 'journals#create'
    get "/journals/:id" => 'journals#show'
    patch "/journals/:id" => 'journals#update'
    delete "/journals/:id" => 'journals#destroy'

    get "/messages" => 'messages#index'
    post "messages/" => 'messages#create'
    get "/messages/:id" => 'messages#show'
    patch "/messages/:id" => 'messages#update'
    delete "/messages/:id" => 'messages#destroy'

    get "/mood_trackers" => 'mood_trackers#index'
    post "mood_trackers/" => 'mood_trackers#create'
    get "/mood_trackers/:id" => 'mood_trackers#show'
    patch "/mood_trackers/:id" => 'mood_trackers#update'

    get "/badges" => 'badges#index'
    get "/badges/:id" => 'badges#show'

    get "/awards" => 'awards#index'
    get "/awards/:id" => 'awards#show'
  end  
end
