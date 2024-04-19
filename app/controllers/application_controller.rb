class ApplicationController < ActionController::Base

  before_action :authenticate_teacher!
  before_action :authenticate_student!
end
