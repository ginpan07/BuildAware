class ApplicationController < ActionController::Base
  before_action :authenticate_student!
  before_action :authenticate_teacher!
end
