class ActivitiesController < ApplicationController
  before_action :authenticate_student!

  def index
    @activities = Activity.all
    @mood = params[:mood]
    @stu_activity = StudentActivity.all

  end

  def show
    # @stu_activity = StudentActivity.find(params[:id])
    # if @stu_activity.present?
    #   @activity = @stu_activity.activity


    @activities = Activity.find(params[:id])
    @student_id = params[:student_id]
    @student = current_student
    #current_student.moods.create(mood: params[:mood])

    if @student.present? && @activities.present?
      check_student_activity = @student.student_activities.find_by(activity_id: @activities.id)
      if check_student_activity.nil?
        @student.student_activities.create(student_id: @student.id, activity_id: @activities.id)
        @stu_activity = StudentActivity.find(params[:id])
        if @stu_activity.present?
          @activity = @stu_activity.activity
        end
      else
        @student.student_activities.last.update(activity_id: @activities.id)
        @stu_activity = StudentActivity.find(params[:id])
        if @stu_activity.present?
          @activity = @stu_activity.activity
        end
      end
    else
      render "show" # Render the journal page again if student or mood is missing
    end
  end
end
