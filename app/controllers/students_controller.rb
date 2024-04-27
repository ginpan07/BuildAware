class StudentsController < ApplicationController
  skip_before_action :authenticate_student!

  def journal
    @mood = params[:mood]
    @student_id = Student.find(params[:student_id])
    @student = current_student
  end

  def moods
    @student = current_student
    if @student.nil?
      render "moods"
    end
  end

  def activities
    @mood = params[:mood]
    @student_id = current_student
  end

  def show

  end

  private

  def student_params
    params.require(:student).permit(:name, :age, :email, :password, :classroom_id)
  end

end
