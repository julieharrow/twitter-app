Rails.application.routes.draw do

  # devise path line of code
  devise_for :users

  # root path
  root 'tweets#index'

  # here are the paths for specific user profiles/a list of all users
  get "profiles/:id" => "profiles#show", as: :profile
  # this one is different because it requires a user's ID, but when we pass someone to a profile page, we will type 'profile_path(params(id[]))' - but that is referencing the 'profiles' controller
  get "profiles" => "profiles#index"
  get "feed" => "profiles#feed"

  # relationships RESTful routes made automatically via rails
  resources :relationships, only: [:create,:destroy]

  resources :tweets do #this single line replaces all the tweet paths written below
    resource :like, only: [:create, :destroy] #singular 'resource' avoids building the index path. When passing two CRUD verbs, you need to pass them as an array.
  end  #likes routes are nested from the tweet paths


  # # all of the paths below would typically have been defined through the call 'resources: tweets' on the tweets controller, however we did not use that shortcut to learn the code behind the scenes
  # post 'tweets' => 'tweets#create'  #actually creates the tweet by sending the params to the server
  # get 'tweets/new' => 'tweets#new', as: 'new/tweet' #needs to be redefined due to rails default path nomenclature - this is referred to as the 'alias'
  # get 'tweets/:id' => 'tweets#show', as: :tweet #needs to be redefined due to rails default path nomenclature - this is referred to as the 'alias'
  # get 'tweets/:id/edit' => 'tweets#edit', as: 'edit/tweet' #needs to be redefined due to rails default path nomenclature - this is referred to as the 'alias'
  # get 'tweets' => 'tweets#index' # not incredibly necessary given the root path, but it is helpful to include so that you can refer to this path in two ways
  # put 'tweets/:id' => 'tweets#update' # put creates a new object
  # patch 'tweets/:id' => 'tweets#update' # patch updates preexisting object
  # delete 'tweets/:id' => 'tweets#destroy'

end
