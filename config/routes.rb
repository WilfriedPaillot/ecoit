Rails.application.routes.draw do
  resources :uts_lessons
  resources :ut_sections
  resources :user_trainings
  resources :lessons
  resources :sections
  resources :trainings
  devise_for :users
  root to: 'static_pages#homepage'
  
  get 'devenez-instructeur', to: 'static_pages#instructor'
  get 'contactez-nous', to: 'static_pages#contact'
end
