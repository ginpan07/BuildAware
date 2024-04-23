class StudentsController < ApplicationController

  skip_before_action :authenticate_student!

  def journal
    @mood = params[:mood]
    @student_id = params[:student_id]
  end

  def moods
    @student = current_student
    if @student.nil?
      render "moods"
    end
  end

  def activities

  end
end
