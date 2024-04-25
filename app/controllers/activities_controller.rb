class ActivitiesController < ApplicationController
  before_action :authenticate_student!

  def index
    @activities = StudentActivity.all
    @mood = params[:mood]
  end

  def show
    @activity = StudentActivity.find(params[:id])
  end
end
