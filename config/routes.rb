Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'

  get 'bikes', to: 'bikes#index', as: :bikes

  get 'bikes/map', to: 'bikes#index_map', as: :bikes_map

  get 'bikes/new', to: 'bikes#new', as: :new_bike

  get 'bikes/:id', to: 'bikes#show', as: :bike

  post 'bikes', to: 'bikes#create'

  get 'bikes/:id/edit', to: 'bikes#edit', as: :edit_bike

  patch 'bikes/:id', to: 'bikes#update'

  delete 'bikes/:id', to: 'bikes#destroy'

  get 'bookings', to: 'bookings#index', as: :bookings

  get 'rentals', to: 'bookings#rentals', as: :rentals

  post 'bikes/:id/bookings', to: 'bookings#create', as: :bike_bookings

  patch 'bookings/:id/confirm', to: 'bookings#confirm', as: :booking_confirm
  patch 'bookings/:id/cancel', to: 'bookings#cancel', as: :booking_cancel

  delete 'bookings/:id', to: 'bookings#destroy', as: :booking_del

  get 'my-bikes', to: "bikes#index_owner", as: :my_bikes
end
