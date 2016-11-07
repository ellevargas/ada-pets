Rails.application.routes.draw do
  get 'pets', to: 'pets#index', as: 'pets'

  get 'pets/search', to: 'pets#search', as: 'pets_search'

  get 'pets/:id', to: 'pets#show', as: 'pet'


end
