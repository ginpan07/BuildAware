class ActivitiesController < ApplicationController
  before_action :authenticate_student!

  def index
    @activities = Activity.where(mood: params[:mood])
  end

  def show
    #@stu_activity = StudentActivity.find(params[:id])
    # if @stu_activity.present?
    #   @activity = @stu_activity.activity
    # end#

    @activity = Activity.find(params[:id])
    @student = current_student

    if @student.present? && @activity.present?
      check_student_activity = @student.student_activities.find_by(activity_id: @activity.id)
      if check_student_activity.nil?
        @student.student_activities.create(student_id: @student.id, activity_id: @activity.id)
      else
        @student.student_activities.last.update(activity_id: @activity.id)
      end
    end
  end
end
