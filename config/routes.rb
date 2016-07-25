Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'

  # all of the paths below would typically have been defined through the call 'resources: tweets' on the tweets controller, however we did not use that shortcut to learn the code behind the scenes

  post 'tweets' => 'tweets#create'  #actually creates the tweet by sending the params to the server
  get 'tweets/new' => 'tweets#new', as: 'new/tweet' #needs to be redefined due to rails default path nomenclature - this is referred to as the 'alias'
  get 'tweets/:id' => 'tweets#show', as: :tweet #needs to be redefined due to rails default path nomenclature - this is referred to as the 'alias'
  get 'tweets/:id/edit' => 'tweets#edit', as: 'edit/tweet' #needs to be redefined due to rails default path nomenclature - this is referred to as the 'alias'
  get 'tweets' => 'tweets#index' # not incredibly necessary given the root path, but it is helpful to include so that you can refer to this path in two ways
  put 'tweets/:id' => 'tweets#update' # put creates a new object
  patch 'tweets/:id' => 'tweets#update' # patch updates preexisting object
  delete 'tweets/:id' => 'tweets#destroy'
end
