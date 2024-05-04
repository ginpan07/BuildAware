class ActivitiesController < ApplicationController
  before_action :authenticate_student!

  def index
<<<<<<< HEAD
    @activities = Activity.all
    @mood = params[:mood]
    @stu_activity = StudentActivity.all

=======
      @activities = Activity.all
      @mood = params[:mood]
      @stu_activity = StudentActivity.all
>>>>>>> b8eb2505c854574be0f3ec5737c80c5bd961394f
  end

  def show
    @stu_activity = StudentActivity.find(params[:id])
    if @stu_activity.present?
      @activity = @stu_activity.activity
    end
  end

end
