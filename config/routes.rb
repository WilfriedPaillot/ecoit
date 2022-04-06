Rails.application.routes.draw do
  resources :trainings
  devise_for :users
  root to: 'static_pages#homepage'
  
  get 'devenez-instructeur', to: 'static_pages#instructor'
  get 'contactez-nous', to: 'static_pages#contact'
end
