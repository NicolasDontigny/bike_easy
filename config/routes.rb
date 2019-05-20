Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'bikes', to: 'bikes#index', as: :bikes

  get 'bikes/:id', to: 'bikes#show', as: :bike

  get 'my-bikes', to: "bikes#index_owner", as: :index_owner

  get 'my-bikes/new', to: 'bikes#new', as: :new_bike

  post 'my-bikes', to: 'bikes#create'

  get 'my-bikes/edit', to: 'bikes#edit', as: :edit_bike

  patch 'my-bikes/:id', to: 'bikes#update', as: :owner_bike

  delete 'my-bikes/:id', to: 'bikes#destroy'

  get 'bookings', to: 'bookings#index', as: :bookings

  get 'rentals', to: 'bookings#rentals', as: :rentals

  post 'bikes/:id/bookings', to: 'bookings#create', as: :bike_bookings

  delete 'booking/:id', to: 'bookings#destroy', as: :booking
end
