class TeachersController < ApplicationController
  before_action :authenticate_teacher!

  def main_page
    @teacher = current_teacher
    @classrooms = @teacher.classrooms
  end

  def mood_summary
    @classroom = Classroom.find(params[:id])
    @students = @classroom.students
    @student_moods = Mood.joins(:students)
  end

  def classroom_detail
    @classroom = Classroom.find(params[:id])
    @students = @classroom.students

  end

  private

  def calculate_mood_summary(students)
      summary = {}
      students.each do |student|
          student_moods.moods each do |mood|
              summary[mood] ||= 0
              summary[mood] += 1
          end
      end
      summary
  end
end
