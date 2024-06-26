Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  get "students/:id/moods", to: "students#moods", as: :student_moods
  # Defines the root path route ("/")
  # root "posts#index"

  get "students/moods", to: "students#moods"
  get "students", to: "students#journal"
  resources :students do
    resources :activities
  end

  get 'classrooms/:id/mood_summary', to: 'classrooms#mood_summary', as: 'classroom_mood_summary'

  get 'teacher-classroom/:id/mood_summary', to: 'teachers#mood_summary', as: 'mood_summary_teacher_classroom'

  get 'teacher-main-page', to: 'teachers#main_page', as: 'teacher_main_page'
  get 'teacher-classroom/:id/classroom_detail', to: 'teachers#classroom_detail', as: 'teacher_classroom'
end
