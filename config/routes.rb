FayeExample::Application.routes.draw do
  resources :participants
  root :to => 'home#index'
  match ':controller(/:action(/:id))(.:format)'
end
