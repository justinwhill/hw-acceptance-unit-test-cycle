Rottenpotatoes::Application.routes.draw do
  root 'movies#index'
  resources :movies
  # map '/' to be a redirect to '/movies'
  # root :to => redirect('/movies')
  get 'same_director/:title' => 'movies#find', as: :find_same_director
end
