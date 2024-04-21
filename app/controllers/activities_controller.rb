class ActivitiesController < ApplicationController
  before_action :authenticate_student!

  def index
    @activities = StudentActivity.all
  end

  def show
    @activity = StudentActivity.find(params[:id])
  end
end
