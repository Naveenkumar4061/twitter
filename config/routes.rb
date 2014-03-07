Twitter::Application.routes.draw do
  devise_for :users
  root :to => 'home#index'

  resources :tweet
	match '/followers', to: 'follows#followers'
	match '/following', to: 'follows#following'
	get '/follows/:id/follow', to: 'follows#follow'
	get '/follows/:id/unfollow', to: 'follows#unfollow'
end
