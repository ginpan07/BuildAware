Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  root to: "pages#home"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "students", to: "students#journal"

  get "students/:id/moods", to: "students#moods", as: :student_moods
  # Defines the root path route ("/")
  # root "posts#index"

  get "students/moods", to: "students#moods"
  resources :students do
    resources :activities
  end

end
