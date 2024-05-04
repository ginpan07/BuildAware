class ActivitiesController < ApplicationController
  before_action :authenticate_student!

  def index
    @activities = Activity.all
    @mood = params[:mood]
    @stu_activity = StudentActivity.all

  end

  def show
    @stu_activity = StudentActivity.find(params[:id])
    if @stu_activity.present?
      @activity = @stu_activity.activity
    end
  end
end
