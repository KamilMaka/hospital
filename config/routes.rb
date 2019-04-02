Rails.application.routes.draw do
  resources :bills
  resources :bill_items
  get 'addresses/create'
  resources :appointments
  resources :reservations
  resources :staffs
  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
