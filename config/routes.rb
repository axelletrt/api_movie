Rails.application.routes.draw do
	root 'movies#search'
  post 'search', to: 'movies#search'
	get 'seach', to: 'movies#search'
end
