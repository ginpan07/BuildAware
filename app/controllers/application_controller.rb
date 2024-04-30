class ApplicationController < ActionController::Base
  before_action :authenticate_student!

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Student)
      students_moods_path
    else
      super
    end
  end
end
