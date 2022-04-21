Rails.application.routes.draw do
  resources :dashboards
  resources :uts_lessons
  resources :ut_sections
  resources :user_trainings
  resources :lessons
  resources :sections
  resources :trainings
  devise_for :users
  root to: 'static_pages#homepage'
  
  scope "/dashboard" do
    get "admin", to: "dashboards#admin", as: "dashboard_admin"
    get "student", to: "dashboards#student", as: "dashboard_student"
    get "instructor", to: "dashboards#instructor", as: "dashboard_instructor"
  end

  get 'devenez-instructeur', to: 'static_pages#instructor'
  get 'contactez-nous', to: 'static_pages#contact'
end
