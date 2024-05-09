class TeachersController < ApplicationController
  before_action :authenticate_teacher!

  def main_page
    @teacher = current_teacher
    @classrooms = @teacher.classrooms
  end

  def mood_summary
    @classroom = Classroom.find(params[:id])
    @mood_summary = calculate_mood_summary(@classroom.students)
    # raise
    respond_to do |format|
      format.html # mood_summary.html.erb
      format.json { render json: @mood_summary }
    end
  end

  def classroom_detail
    @classroom = Classroom.find(params[:id])
    @students = @classroom.students

  end

  private

  def calculate_mood_summary(students)
    summary = {}
    students.each do |student|
      student.moods.each do |mood|
        summary[mood.mood] ||= 0
        summary[mood.mood] += 1
      end
    end
    summary
  end
end
