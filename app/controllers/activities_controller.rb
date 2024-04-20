class ActivitiesController < ApplicationController
  before_action :authenticate_student!

  def index
    @activities = StudentActivity.all
  end
end
