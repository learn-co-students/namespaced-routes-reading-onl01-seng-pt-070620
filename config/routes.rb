Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # get '/stats', to: 'stats#index'
  #get '/admin/stats', to: 'stats#index'

  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

#When we want to route with a module and use that module's name as the URL prefix,
#we can use the namespace method instead of scope, module

  namespace :admin do
    resources :stats, only: [:index]
  end




  root 'posts#index'
end
