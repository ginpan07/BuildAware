class ApplicationController < ActionController::Base
  before_action :authenticate_teacher!, if: :teacher_signed_in?
  before_action :authenticate_student!, if: :student_signed_in?

  protected

  def after_sign_in_path_for(resource)
    # Customize the redirection logic based on the resource type
    if resource.is_a?(Student)
      # Redirect students to the student dashboard page
      students_moods_path
    elsif resource.is_a?(Teacher)
      # Redirect teachers to the teacher dashboard page
      teacher_main_page_path
    else
      # Redirect other users to the default page
      super
    end
  end
end
